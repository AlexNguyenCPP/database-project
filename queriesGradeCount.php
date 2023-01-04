<html>
<body>

<?php

$link = mysqli_connect('mariadb', 'cs332g19', 'Sh0zN8Eg','cs332g19');
if (!$link) {
  die('Could not connect: ' . mysql_error());
  }

$SectionNo = $_POST["SectionNo"];
$CourseNo = $_POST["Cno"];

$query = "SELECT DISTINCT grade, COUNT(grade) FROM ENROLLMENT, SECTION WHERE SECTION.SectionNo = $SectionNo AND SECTION.Cno = $CourseNo AND SECTION.SectionNo = ENROLLMENT.CourseSection AND SECTION.Cno = ENROLLMENT.CourseNumber GROUP BY grade;";

$result = $link->query($query);
$nor = $result->num_rows;

for($i=0; $i<$nor; $i++)
{
$row=$result->fetch_assoc();
printf("Grade: %s<br>\n", $row["grade"]);
printf("count: %s<br>\n", $row["COUNT(grade)"]);
echo "<br>";
}
$result->free_result();
$link->close();

?>

</body>
</html>
