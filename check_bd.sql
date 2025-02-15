SELECT * FROM agents WHERE branch_id NOT IN (SELECT branch_id FROM branches);
SELECT * FROM contracts WHERE insurance_type_id NOT IN (SELECT insurance_type_id FROM insurance_types);
SELECT * FROM contracts WHERE branch_id NOT IN (SELECT branch_id FROM branches);
SELECT * FROM contracts WHERE client_id NOT IN (SELECT client_id FROM clients);
SELECT * FROM contracts WHERE agent_id IS NOT NULL AND agent_id NOT IN (SELECT agent_id FROM agents);

SELECT * FROM contracts WHERE date > CURRENT_DATE;
SELECT * FROM contracts WHERE insurance_amount <= 0 OR rate <= 0 OR rate > 100;
SELECT * FROM agents WHERE salary <= 0;

SELECT client_id, date, insurance_type_id, COUNT(*) AS duplicates
FROM contracts
GROUP BY client_id, date, insurance_type_id
HAVING COUNT(*) > 1;

SELECT * FROM contracts WHERE contract_status = 'active' AND date < CURRENT_DATE - INTERVAL '1 YEAR';

SELECT 'branches' AS table_name, COUNT(*) AS total FROM branches
UNION ALL
SELECT 'clients', COUNT(*) FROM clients
UNION ALL
SELECT 'agents', COUNT(*) FROM agents
UNION ALL
SELECT 'insurance_types', COUNT(*) FROM insurance_types
UNION ALL
SELECT 'contracts', COUNT(*) FROM contracts;
