COMMENT ON SCHEMA
    awjf_waldpflege_erfassung
IS
    '... foo bar ...'
;

DROP ROLE IF EXISTS gretl;
CREATE USER gretl NOSUPERUSER LOGIN PASSWORD 'gretl';


GRANT USAGE ON SCHEMA awjf_waldpflege_erfassung TO public, gretl;

GRANT SELECT ON ALL TABLES IN SCHEMA awjf_waldpflege_erfassung TO public;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA awjf_waldpflege_erfassung TO gretl;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA awjf_waldpflege_erfassung TO gretl;
