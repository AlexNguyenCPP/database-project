<html>
<body>

<?php

$link = mysqli_connect('mariadb', 'cs332g19', 'Sh0zN8Eg','cs332g19');
if (!$link) {
  die('Could not connect: ' . mysql_error());
  }

$Cno = $_POST["Cno"];

$query = "SELECT SectionNo, Classroom, Days, BeginTime, EndTime, COUNT(Sid) FROM SECTION, ENROLLMENT WHERE SECTION.Cno = '$Cno' AND SECTION.Cno = ENROLLMENT.CourseNumber AND SECTION.SectionNo = ENROLLMENT.CourseSection GROUP BY SectionNo;";
$result = $link->query($query);
$nor = $result->num_rows;

for($i=0; $i<$nor; $i++)
{
$row=$result->fetch_assoc();
printf("Section: %s<br>\n", $row["SectionNo"]);
printf("Classroom: %s<br>\n", $row["Classroom"]);
printf("Meeting days: %s<br>\n", $row["Days"]);
printf("Begin time: %s<br>\n", $row["BeginTime"]);
printf("End Time: %s<br>\n", $row["EndTime"]);
printf("Number of students enrolled: %s<br>\n", $row["COUNT(Sid)"]);
echo "<br>";
}
$result->free_result();
$link->close();

?>

</body>
</html>
