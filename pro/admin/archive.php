<?php
if (!isset($file_access)) die("Direct File Access Denied");
$source = 'archive';
$me = "?page=$source";
?>

<div class="content">
    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <div class="card card-success">
                        <div class="card-header">
                            <h3 class="card-title">
                                Archive of Schedules
                            </h3>
                        </div>

                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="example1" style="align-items: stretch;" class="table table-hover w-100 table-bordered table-striped<?php //
                                                                                                                                                ?>">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Ferry</th>
                                            <th>Route</th>
                                            <th>Ticket Fee</th>
                                            <th>Total Bookings</th>
                                            <th>Date/Time</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $row = $conn->query("SELECT * FROM archive ORDER BY id DESC");

                                        if ($row->num_rows < 1) echo "No Records Yet";
                                        $sn = 0;
                                        while ($fetch = $row->fetch_assoc()) {
                                            $id = $fetch['id']; ?><tr>
                                                <td><?php echo ++$sn; ?></td>
                                                <td><?php echo getTrainName($fetch['train_id']); ?></td>
                                                <td><?php echo getRoutePath($fetch['route_id']);
                                                    $fullname = " Schedule" ?></td>
                                                <td>₱ <?php echo ($fetch['first_fee']); ?></td>
                                                <td><?php $array = getTotalBookByType2($id);
                                                    echo (($array['first'] - $array['first_booked'])), " Seat(s) Available";
                                                    ?></td>
                                                <td><?php echo $fetch['date'], " / ", formatTime($fetch['time']); ?></td>

                                                <td>
                                                    <form method="POST" style='float:left;'>
                                                        <input type="hidden" class="form-control" name="res_train" value="<?php echo $id ?>" required id="">
                                                        <input type="hidden" class="form-control" name="rem_train" value="<?php echo $id ?>" required id="">
                                                        <button type="submit" class="btn btn-primary">
                                                            Restore
                                                        </button> - &nbsp; 
                                                    </form>
                                                    <form method="POST" style='float:left;'>
                                                        <input type="hidden" class="form-control" name="del_train" value="<?php echo $id ?>" required id="">
                                                        <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to permanently delete this schedule?')">
                                                            Delete
                                                        </button>
                                                    </form>
                                                </td>

                                            </tr>


                                        <?php
                                        }
                                        ?>

                                    </tbody>

                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
</div>
</div>
</div>
</section>
</div>

<div class="modal fade" id="add">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" align="center">
            <div class="modal-header">
                <h4 class="modal-title">Add New Schedule &#128649;
                </h4>

                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="" method="post">
                    <div class="row">
                        <div class="col-sm-6">
                            Ferry : <select class="form-control" name="train_id" required id="">
                                <option value="">Select Ferry</option>
                                <?php
                                $con = connect()->query("SELECT * FROM train");
                                while ($row = $con->fetch_assoc()) {
                                    echo "<option value='" . $row['id'] . "'>" . $row['name'] . "</option>";
                                }
                                ?>
                            </select>

                        </div>
                        <div class="col-sm-6">
                            Route : <select class="form-control" name="route_id" required id="">
                                <option value="">Select Route</option>
                                <?php
                                $con = connect()->query("SELECT * FROM route");
                                while ($row = $con->fetch_assoc()) {
                                    echo "<option value='" . $row['id'] . "'>" . getRoutePath($row['id']) . "</option>";
                                }
                                ?>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            Ticket Charge : <input class="form-control" type="number" name="first_fee" required id="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            Date : <input class="form-control" onchange="check(this.value)" type="date" name="date" required id="date">
                        </div>
                        <div class="col-sm-6">

                            Time : <input class="form-control" type="time" name="time" required id="">
                        </div>
                    </div>
                    <hr>
                    <input type="submit" name="submit" class="btn btn-success" value="Add Schedule"></p>
                </form>

                <script>
                    function check(val) {
                        val = new Date(val);
                        var age = (Date.now() - val) / 31557600000;
                        var formDate = document.getElementById('date');
                        if (age > 0) {
                            alert("Past/Current Date not allowed");
                            formDate.value = "";
                            return false;
                        }
                    }
                </script>

            </div>

        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>


<div class="modal fade" id="add2">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" align="center">
            <div class="modal-header">
                <h4 class="modal-title">Add Range Schedule &#128649;
                </h4>

                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

                <script>
                    function check(val) {
                        val = new Date(val);
                        var age = (Date.now() - val) / 31557600000;
                        var formDate = document.getElementById('date');
                        if (age > 0) {
                            alert("You are using a past/current date!");
                            val.value = "";
                            return false;
                        }
                    }
                </script>

            </div>

        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<?php

if (isset($_POST['submit'])) {
    $route_id = $_POST['route_id'];
    $train_id = $_POST['train_id'];
    $first_fee = $_POST['first_fee'];
    $second_fee = $_POST['second_fee'];
    $date = $_POST['date'];
    $date = formatDate($date);
    // die($date);
    // $endDate = date('Y-m-d' ,strtotime( $data['automatic_until'] ));
    $time = $_POST['time'];
    if (!isset($route_id, $train_id, $first_fee, $second_fee, $date, $time)) {
        alert("Fill Form Properly!");
    } else {
        $conn = connect();
        $ins = $conn->prepare("INSERT INTO `schedule`(`train_id`, `route_id`, `date`, `time`, `first_fee`, `second_fee`) VALUES (?,?,?,?,?,?)");
        $ins->bind_param("iissii", $train_id, $route_id, $date, $time, $first_fee, $second_fee);
        $ins->execute();
        alert("Schedule Added!");
        load($_SERVER['PHP_SELF'] . "$me");
    }
}


if (isset($_POST['submit2'])) {
    $route_id = $_POST['route_id'];
    $train_id = $_POST['train_id'];
    $first_fee = $_POST['first_fee'];
    $second_fee = $_POST['second_fee'];
    $from_date = $_POST['from_date'];
    $to_date = $_POST['to_date'];
    $every = $_POST['every'];

    $time = $_POST['time'];
    if (!isset($route_id, $train_id, $first_fee, $second_fee, $date, $time)) {
        alert("Fill Form Properly!");
    } else {


        $from_date = formatDate($from_date);
        $to_date = formatDate($to_date);
        $startDate = $from_date;
        $endDate = $to_date;
        $conn = connect();
        if ($every == 'Day') {
            for ($i = strtotime($startDate); $i <= strtotime($endDate); $i = strtotime('+1 day', $i)) {
                $date = date('d-m-Y', $i);
                $ins = $conn->prepare("INSERT INTO `schedule`(`train_id`, `route_id`, `date`, `time`, `first_fee`, `second_fee`) VALUES (?,?,?,?,?,?)");
                $ins->bind_param("iissii", $train_id, $route_id, $date, $time, $first_fee, $second_fee);
                $ins->execute();
            }
        } else {
            for ($i = strtotime($every, strtotime($startDate)); $i <= strtotime($endDate); $i = strtotime('+1 week', $i)) {
                $date = date('d-m-Y', $i);

                $ins = $conn->prepare("INSERT INTO `schedule`(`train_id`, `route_id`, `date`, `time`, `first_fee`, `second_fee`) VALUES (?,?,?,?,?,?)");
                $ins->bind_param("iissii", $train_id, $route_id, $date, $time, $first_fee, $second_fee);
                $ins->execute();
            }
        }


        alert("Schedules Added!");
        load($_SERVER['PHP_SELF'] . "$me");
    }
}


if (isset($_POST['res_train'], $_POST['rem_train'])) {

    $con = connect();
    $sbutton = $_POST['res_train'];
    $id = $_POST['rem_train'];
    $conn = $con->query("INSERT INTO schedule SELECT * FROM archive WHERE id = $sbutton");
    $conn = $con->query("DELETE FROM archive WHERE id = $id ");

    if ($con->affected_rows < 1) {
        alert("Schedule Could Not Be Deleted. This Route Has Been Tied To Another Data!");
        load($_SERVER['PHP_SELF'] . "$me");
    } else {

        alert("Scheduled has been Restored!");
        load($_SERVER['PHP_SELF'] . "$me");
    }
}

if (isset($_POST['del_train'])) {
    $con = connect();
    $conn = $con->query("DELETE FROM archive WHERE id = '" . $_POST['del_train'] . "'");

    alert("Schedule will be permanently Deleted!");
    load($_SERVER['PHP_SELF'] . "$me");
}
?>