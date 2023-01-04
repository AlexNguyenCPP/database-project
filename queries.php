<html>
<body>

<?php

$link = mysqli_connect('mariadb', 'cs332g19', 'Sh0zN8Eg','cs332g19');
if (!$link) {
  die('Could not connect: ' . mysql_error());
  }

$query = "SELECT CourseTitle, Grade FROM STUDENT, ENROLLMENT, COURSE WHERE STUDENT.Cwid = ENROLLMENT.SID AND ENROLLMENT.CourseNumber = COURSE.CourseNo AND STUDENT.Cwid = " . $_POST["Cwid"];
$result = $link->query($query);
$nor = $result->num_rows;

for($i=0; $i<$nor; $i++)
{
$row=$result->fetch_assoc();
printf("Course Name: %s<br>\n", $row["CourseTitle"]);
printf("Grade: %s<br>\n", $row["Grade"]);
echo "<br>";
}
$result->free_result();
$link->close();

?>

</body>
</html>
