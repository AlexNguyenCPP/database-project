<html>
<body>

<?php

$link = mysqli_connect('mariadb', 'cs332g19', 'Sh0zN8Eg','cs332g19');
if (!$link) {
  die('Could not connect: ' . mysql_error());
  }

$query = "SELECT CourseTitle, Classroom, Days, BeginTime FROM PROFESSOR, SECTION, COURSE WHERE PROFESSOR.Ssn = SECTION.Pssn AND SECTION.Cno = COURSE.CourseNo AND PROFESSOR.Ssn = " . $_POST["Ssn"];
$result = $link->query($query);
$nor = $result->num_rows;

for($i=0; $i<$nor; $i++)
{
$row=$result->fetch_assoc();
printf("Course Title: %s<br>\n", $row["CourseTitle"]);
printf("Classroom: %s<br>\n", $row["Classroom"]);
printf("Meeting days: %s<br>\n", $row["Days"]);
printf("Time: %s<br>\n", $row["BeginTime"]);
echo "<br>";
}
$result->free_result();
$link->close();

?>

</body>
</html>
