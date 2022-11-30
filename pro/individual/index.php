<?php
if (!isset($file_access)) die("Direct File Access Denied");
?>

<div class="content">
    <div class="container-fluid">
        <?php
        if (!isset($_POST['submit'])) {
        ?>
        <div class="row">
            <div class="col-lg-12">

                <div class="card">
                    <div class="card-header alert-success">
                        <h5 class="m-0">Quick Tips</h5>
                    </div>
                    <div class="card-body">
                        Use the links at the left.
                        <br />You can see list of schedules by clicking on "New Booking". The system will display list
                        of available schedules for you which you can view and make bookings from. <br>Before your
                        bookings are saved, you are redirected to make payment. <br>After a successful payment, system
                        generates your ticket ID for you which you are required to bring to the station. <br>You are
                        allowed to view all your booking history by clicking on "View Bookings".
                    </div>
                    <div class="card-body">
                        


                    </div>
                </div>
                <div class="card">
                <div class="card-header alert-success">
                        <h5 class="m-0">Rules and Policies</h5>
                    </div>
                <table class="table table-bordered" id=''>
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Policy</th>
                                    <th>Description</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $sn = 0;
                                $query = getUpdatedPolicy();
                                while ($row = $query->fetch_assoc()) {
                                    $sn++;
                                    echo "<tr>
                                    <td>$sn</td>
                                    <td><b>" . $row['entry'] . "</b></td>
                                    <td>" . ($row['description'] == NULL ? '-- No Response Yet --' : $row['description']) . "</b></td>
                                    </tr>";
                                }
                                ?>
                            </tbody>
                        </table>
            </div>
            </div><?php
                    } else {
                        $class = $_POST['class'];
                        $number = $_POST['number'];
                        $classification = $_POST['classification'];
                        $schedule_id = $_POST['id'];
                        if ($number < 1) die("Invalid Number");
                        ?>

            <div class="row">
                <div class="col-lg-12">

                    <div class="card">
                        <div class="card-header alert-success">
                            <h5 class="m-0">Booking Preview</h5>
                        </div>
                        <div class="card-body">
                            <div class="callout callout-info">
                                <h5><i class="fas fa-info"></i> <?php echo ucwords($class), " Class" ?>:</h5>
                                You are about to book
                                <?php echo $number, " Ticket", $number > 1 ? 's' : '', ' for ', getRouteFromSchedule($schedule_id); ?>
                                
                                <br />
                                

                                <?php
                                   $sql = "SELECT COUNT(id) as fcount FROM schedule WHERE free = 1 AND id = $schedule_id";
                                   $conn = connect()->query($sql);
                                   $row = $conn->fetch_assoc();
                                   $hakdoggi = $row['fcount'];
                                   $fee = ($_SESSION['amount'] = getFee($schedule_id, $class));
                                    $discount = ($fee * $classification );
                                    if ($hakdoggi == 1){
                                        echo $number," x ₱", $fee, " = ₱", ($fee * $number), "<hr/>";
                                        $fee = $fee * $number;
                                        $amount = intval($fee);
                                        echo "V.A.T Charges = ₱$vat<br/><br/><hr/>";
                                        echo "Discounted = ₱$discount<br/><br/><hr/>";
                                        echo "Total = ₱", $total = 1;
                                        $fee =  ($total) . "00";
                                    $_SESSION['amount'] =  $total;
                                    $_SESSION['original'] =  $fee;
                                    $_SESSION['schedule'] =  $schedule_id;
                                    $_SESSION['no'] =  $number;
                                    $_SESSION['class'] =  $class;
                                    
                                    }else{
                                        echo $number," x ₱", $fee, " = ₱", ($fee * $number), "<hr/>";
                                        $fee = $fee * $number;
                                        $amount = intval($fee);
                                        $vat = ceil($fee * 0.01);
                                        echo "V.A.T Charges = ₱$vat<br/><br/><hr/>";
                                        echo "Discounted = ₱$discount<br/><br/><hr/>";
                                        echo "Total = ₱", $total = ($amount - $discount) + $vat;
                                        $fee =  intval($total) . "00";
                                    $_SESSION['amount'] =  $total;
                                    $_SESSION['original'] =  $fee;
                                    $_SESSION['schedule'] =  $schedule_id;
                                    $_SESSION['no'] =  $number;
                                    $_SESSION['class'] =  $class;
                                    }                                                                                                                                               
                                  
                                    ?>
                                   
                                    
                            </div>
                            <a href="pay.php"><button
                                    onclick="return confirm('You will be directed to make your payment.\nPayment finalizes your booking!')"
                                    class="btn btn-primary">Pay Now</button></a>
                        </div>
                    </div>
                </div>
                <?php
                    }
                ?>
            </div>
        </div>
    </div>
</div>