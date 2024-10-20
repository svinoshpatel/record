type student = record
  faculty: string[15];
  lastname: string[16];
  course: integer;
end;

var
  i, j, n, a: Integer;
  data: array[1..5] of student;

procedure search;
begin
  for i := 1 to n do
  if data[i].course = 3 then
    with data[i] do
    writeln(faculty:12, ' ', lastname:15, ' ', course)
end;

begin
  write('Enter the number of students: ');
  readln(n);
  writeln('Enter the faculty and the student''s last name: ');
  writeln('----------------------------------------------');
  for i := 1 to n do
  begin
    with data[i] do
    begin
      write('Enter the faculty -> ');
      readln(faculty);
      write('Enter the student''s last name -> ');
      readln(lastname);
      write('Enter the course number -> ');
      readln(course);
    end
  end;
  writeln('=============================================');
  writeln('List of third-year students');
  writeln('Faculty last name course: ');
  writeln('---------------------------------------------');
  search;
  readln
end.
