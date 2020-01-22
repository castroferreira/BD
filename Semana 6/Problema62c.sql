USE p4g1;

-- Problema 6.2
-- c) Converta as queries AR em queries SQL.

-- Exercício 5.1
-- a.
SELECT Pno, Fname, Lname 
FROM employee JOIN works_on ON Ssn=Essn;

-- b.
SELECT Fname,Minit,Lname,Ssn 
FROM Employee 
WHERE Fname='Carlos' AND Minit='D' AND Lname ='Gomes' AND Super_ssn != NULL

-- c.
SELECT SUM(Hours) 
FROM works_on JOIN Project ON Pno=Pnumber 
GROUP BY Pno;

-- d.
SELECT Fname,Minit,Lname 
FROM employee JOIN (works_on JOIN project ON Pno=Pnumber) ON Ssn=Essn 
WHERE Pname='Aveiro Digital' AND Dno=3 HAVING Hours>20

-- e.
SELECT Fname, Lname 
FROM empresa.Employee JOIN empresa.WorksON ON Ssn=Essn 
WHERE Essn IS NULL;
SELECT Fname, Minit, Lname FROM employee LEFT OUTER JOIN works_on ON Ssn=Essn WHERE Pno IS NULL;

-- f.
SELECT AVG(Salary) AS Med_Salary 
FROM department JOIN employee ON Dnumber=Dno 
WHERE Sex='F' 
GROUP BY Dname;

-- g.
SELECT COUNT(Essn) AS Num_Dependent 
FROM employee JOIN [dependent] ON Ssn=Essn 
GROUP BY Ssn 
HAVING Num_Dependet > 2;

-- h.
SELECT Dname,Mgr_ssn,COUNT(Essn) AS Num_Dependet
FROM department JOIN (employee LEFT OUTER JOIN [dependent] ON Ssn=Essn) 
WHERE COUNT(Essn) = 0 GROUP BY Ssn;

-- i.
SELECT Fname, Minit, Lname,[Address],Pname,Plocation,Dlocation 
FROM dept_location JOIN (employee JOIN (works_on JOIN project ON Pno=Pnumber) ON Ssn=Essn) ON Dnum=Dnumber 
WHERE Plocation='Aveiro' AND Dlocation!='Aveiro';


-- Exercício 5.2
-- a.
FROM fornecedor LEFT OUTER JOIN encomenda ON nif = fornecedor
WHERE numero IS NULL;	

-- b.
SELECT AVG(item.unidades) AS UnidadesMedias
FROM produto JOIN item ON codigo=codProd
GROUP BY codProd;

-- c.
SELECT AVG(COUNT(stocks.numEnc)) FROM encomenda JOIN item ON numEnc=encomenda.numero GROUP BY numEnc;

-- d.
SELECT codigo, produto.nome,item.unidades,nif 
FROM (fornecedor JOIN (encomenda JOIN (produto JOIN item ON codigo=codProd) ON numero=numEnc) ON nif=fornecedor);

-- Exercício 5.3
-- a.
FROM paciente LEFT OUTER JOIN prescricao ON paciente.numUtente=prescricao.numUtente 
WHERE numPresc IS NULL;

-- b.
SELECT COUNT(numPresc) AS Cont_Presc 
FROM medico JOIN prescricao ON numSNS=numMedico 
GROUP BY especialidade;

-- c.
SELECT count(numPresc) AS Cont_Presc 
FROM farmacia JOIN prescricao ON nome=farmacia 
GROUP BY nome;

-- d.
SELECT farmaco.numRegFarm,farmaco.nome,formula,presc_farmaco.numRegFarm 
FROM (farmaceutica JOIN (farmaco JOIN presc_farmaco ON nome=nomeFarmaco) ON numReg=presc_farmaco.numRegFarm)
WHERE farmaco.numRegFarm=906 HAVING presc_farmaco.numPresc IS NULL;

-- e.

-- f.
SELECT nome,prescricoes 
FROM (SELECT nome, numUtente 
	  FROM paciente RIGHT OUTER JOIN (
	  SELECT count(numUtent) AS prescricoes 
	  FROM (SELECT numUtent, numMedico
	  FROM prescricao)
	  GROUP BY numUtente)
);