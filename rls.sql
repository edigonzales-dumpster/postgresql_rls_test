--REVOKE ALL ON SCHEMA awjf_waldpflege_erfassung FROM bob;
--REVOKE ALL ON SCHEMA awjf_waldpflege_erfassung FROM alice;

DROP ROLE IF EXISTS bob;
DROP ROLE IF EXISTS alice;

CREATE USER bob NOSUPERUSER LOGIN PASSWORD 'bob';
CREATE USER alice NOSUPERUSER LOGIN PASSWORD 'alice';

GRANT USAGE ON SCHEMA awjf_waldpflege_erfassung TO bob, alice;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA awjf_waldpflege_erfassung TO bob, alice;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA awjf_waldpflege_erfassung TO bob, alice;

CREATE POLICY waldpflege_erfassung_policy ON awjf_waldpflege_erfassung.waldpflege_waldpflege
    USING (erfasser = current_user)
    WITH CHECK (erfasser = current_user);

ALTER TABLE awjf_waldpflege_erfassung.waldpflege_waldpflege ENABLE ROW LEVEL SECURITY;
 

--SET ROLE bob;
--SELECT * FROM awjf_waldpflege_erfassung.waldpflege_waldpflege;
 