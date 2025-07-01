-- subaufgabe a
SELECT XMLQuery('
  <html>
    <body>
      <table border="1">
        <tr>
          <th>Id</th>
          <th>Name</th>
          <th>Beruf</th>
          <th>Gehalt</th>
          <th>Einstellungsdatum</th>
        </tr>
        {
          for $e in ora:view("emp")/ROW
          return
            <tr>
              <td>{$e/EMPNO/text()}</td>
              <td>{$e/ENAME/text()}</td>
              <td>{$e/JOB/text()}</td>
              <td>{$e/SAL/text()}</td>
              <td>{$e/HIREDATE/text()}</td>
            </tr>
        }
      </table>
    </body>
  </html>'
  RETURNING CONTENT
) AS html_output
FROM DUAL;

-- subaufgabe b
SELECT XMLQuery('
  <html>
    <body>
      <table border="1">
        <tr>
          <th>Id</th>
          <th>Name</th>
          <th>Beruf</th>
          <th>Gehalt</th>
          <th>Einstellungsdatum</th>
          <th>Abteilung</th>
        </tr>
        {
          for $e in ora:view("emp")/ROW
          return
            <tr>
              <td>{$e/EMPNO/text()}</td>
              <td>{$e/ENAME/text()}</td>
              <td>{$e/JOB/text()}</td>
              <td>{$e/SAL/text()}</td>
              <td>{$e/HIREDATE/text()}</td>
              <td>{$e/DEPTNO/text()}</td>
            </tr>
        }
      </table>
    </body>
  </html>'
  RETURNING CONTENT
) AS html_output
FROM DUAL;
