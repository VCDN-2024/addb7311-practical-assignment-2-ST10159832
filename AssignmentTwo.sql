
CREATE TABLE CUSTOMER (
    CUSTOMER_ID NUMBER(5) PRIMARY KEY,
    FIRST_NAME VARCHAR2(50),
    SURNAME VARCHAR2(50),
    ADDRESS VARCHAR2(100),
    CONTACT_NUMBER VARCHAR2(15),
    EMAIL VARCHAR2(100)
);


CREATE TABLE EMPLOYEE (
    EMPLOYEE_ID VARCHAR2(10) PRIMARY KEY,
    FIRST_NAME VARCHAR2(50),
    SURNAME VARCHAR2(50),
    CONTACT_NUMBER VARCHAR2(15),
    ADDRESS VARCHAR2(100),
    EMAIL VARCHAR2(100)
);


CREATE TABLE DONATOR (
    DONATOR_ID NUMBER(5) PRIMARY KEY,
    FIRST_NAME VARCHAR2(50),
    SURNAME VARCHAR2(50),
    CONTACT_NUMBER VARCHAR2(15),
    EMAIL VARCHAR2(100)
);


CREATE TABLE DONATION (
    DONATION_ID NUMBER(5) PRIMARY KEY,
    DONATOR_ID NUMBER(5),
    DONATION VARCHAR2(100),
    PRICE NUMBER(10, 2),
    DONATION_DATE DATE,
    FOREIGN KEY (DONATOR_ID) REFERENCES DONATOR(DONATOR_ID)
);

CREATE TABLE DELIVERY (
    DELIVERY_ID NUMBER(5) PRIMARY KEY,
    DELIVERY_NOTES VARCHAR2(100),
    DISPATCH_DATE DATE,
    DELIVERY_DATE DATE
);


CREATE TABLE RETURNS (
    RETURN_ID VARCHAR2(10) PRIMARY KEY,
    RETURN_DATE DATE,
    REASON VARCHAR2(255),
    CUSTOMER_ID NUMBER(5),
    DONATION_ID NUMBER(5),
    EMPLOYEE_ID VARCHAR2(10),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
    FOREIGN KEY (DONATION_ID) REFERENCES DONATION(DONATION_ID),
    FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID)
);

CREATE TABLE INVOICE (
    INVOICE_NUM NUMBER(5) PRIMARY KEY,
    CUSTOMER_ID NUMBER(5),
    INVOICE_DATE DATE,
    EMPLOYEE_ID VARCHAR2(10),
    DONATION_ID NUMBER(5),
    DELIVERY_ID NUMBER(5),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
    FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID),
    FOREIGN KEY (DONATION_ID) REFERENCES DONATION(DONATION_ID),
    FOREIGN KEY (DELIVERY_ID) REFERENCES DELIVERY(DELIVERY_ID)
);


INSERT INTO CUSTOMER VALUES (11011, 'Jack', 'Smith', '18 Water Rd', '0877277521', 'jsmith@isat.com');
INSERT INTO CUSTOMER VALUES (11012, 'Pat', 'Hendricks', '22 Water Rd', '0863257857', 'ph@mcom.co.za');
INSERT INTO CUSTOMER VALUES (11013, 'Andre', 'Clark', '101 Summer Lane', '0834567891', 'aclark@mcom.co.za');
INSERT INTO CUSTOMER VALUES (11014, 'Kevin', 'Jones', '55 Mountain way', '0612547895', 'kj@isat.co.za');
INSERT INTO CUSTOMER VALUES (11015, 'Lucy', 'Williams', '5 Main rd', '0827238521', 'lw@mcal.co.za');


INSERT INTO EMPLOYEE VALUES ('emp101', 'Jeff', 'Davis', '0877277521', '10 main road', 'jand@isat.com');
INSERT INTO EMPLOYEE VALUES ('emp102', 'Kevin', 'Marks', '0837377522', '18 water road', 'km@isat.com');
INSERT INTO EMPLOYEE VALUES ('emp103', 'Adanya', 'Andrews', '0817117523', '21 circle lane', 'aa@isat.com');
INSERT INTO EMPLOYEE VALUES ('emp104', 'Adebayo', 'Dryer', '0797215244', '1 sea road', 'aryer@isat.com');
INSERT INTO EMPLOYEE VALUES ('emp105', 'Xolani', 'Samson', '0827122255', '12 main road', 'xosam@isat.com');


INSERT INTO DONATOR VALUES (20111, 'Jeff', 'Watson', '0827172250', 'jwatson@ymail.com');
INSERT INTO DONATOR VALUES (20112, 'Stephen', 'Jones', '0837865670', 'joness@ymail.com');
INSERT INTO DONATOR VALUES (20113, 'James', 'Joe', '0878978650', 'jj@isat.com');
INSERT INTO DONATOR VALUES (20114, 'Kelly', 'Ross', '0826575650', 'kross@gsat.com');
INSERT INTO DONATOR VALUES (20115, 'Abraham', 'Clark', '0797656430', 'aclark@ymail.com');


INSERT INTO DONATION VALUES (7111, 20111, 'KIC Fridge', 599, TO_DATE('01-MAY-2024', 'DD-MON-YYYY'));
INSERT INTO DONATION VALUES (7112, 20112, 'Samsung 42inch LCD', 1299, TO_DATE('03-MAY-2024', 'DD-MON-YYYY'));
INSERT INTO DONATION VALUES (7113, 20113, 'Sharp Microwave', 1599, TO_DATE('03-MAY-2024', 'DD-MON-YYYY'));
INSERT INTO DONATION VALUES (7114, 20115, '6 Seat Dining room table', 799, TO_DATE('05-MAY-2024', 'DD-MON-YYYY'));
INSERT INTO DONATION VALUES (7115, 20114, 'Lazyboy Sofa', 1199, TO_DATE('07-MAY-2024', 'DD-MON-YYYY'));
INSERT INTO DONATION VALUES (7116, 20113, 'JVC Surround Sound System', 179, TO_DATE('09-MAY-2024', 'DD-MON-YYYY'));


INSERT INTO DELIVERY VALUES (511, 'Double packaging requested', TO_DATE('10-MAY-2024', 'DD-MON-YYYY'), TO_DATE('15-MAY-2024', 'DD-MON-YYYY'));
INSERT INTO DELIVERY VALUES (512, 'Delivery to work address', TO_DATE('12-MAY-2024', 'DD-MON-YYYY'), TO_DATE('15-MAY-2024', 'DD-MON-YYYY'));
INSERT INTO DELIVERY VALUES (513, 'Signature required', TO_DATE('12-MAY-2024', 'DD-MON-YYYY'), TO_DATE('17-MAY-2024', 'DD-MON-YYYY'));
INSERT INTO DELIVERY VALUES (514, 'No notes', TO_DATE('12-MAY-2024', 'DD-MON-YYYY'), TO_DATE('15-MAY-2024', 'DD-MON-YYYY'));
INSERT INTO DELIVERY VALUES (515, 'Birthday present wrapping required', TO_DATE('18-MAY-2024', 'DD-MON-YYYY'), TO_DATE('19-MAY-2024', 'DD-MON-YYYY'));
INSERT INTO DELIVERY VALUES (516, 'Delivery to work address', TO_DATE('20-MAY-2024', 'DD-MON-YYYY'), TO_DATE('25-MAY-2024', 'DD-MON-YYYY'));


INSERT INTO RETURNS VALUES ('ret001', TO_DATE('25-MAY-2024', 'DD-MON-YYYY'), 'Customer not satisfied with product', 11011, 7116, 'emp101');
INSERT INTO RETURNS VALUES ('ret002', TO_DATE('25-MAY-2024', 'DD-MON-YYYY'), 'Product had broken section', 11013, 7114, 'emp103');


INSERT INTO INVOICE VALUES (8111, 11011, TO_DATE('15-MAY-2024', 'DD-MON-YYYY'), 'emp103', 7111, 511);
INSERT INTO INVOICE VALUES (8112, 11013, TO_DATE('15-MAY-2024', 'DD-MON-YYYY'), 'emp101', 7114, 512);
INSERT INTO INVOICE VALUES (8113, 11012, TO_DATE('17-MAY-2024', 'DD-MON-YYYY'), 'emp101', 7112, 513);
INSERT INTO INVOICE VALUES (8114, 11015, TO_DATE('17-MAY-2024', 'DD-MON-YYYY'), 'emp102', 7113, 514);
INSERT INTO INVOICE VALUES (8115, 11011, TO_DATE('17-MAY-2024', 'DD-MON-YYYY'), 'emp102', 7115, 515);
INSERT INTO INVOICE VALUES (8116, 11015, TO_DATE('18-MAY-2024', 'DD-MON-YYYY'), 'emp103', 7116, 516);

--q2
SELECT 
    C.FIRST_NAME || ', ' || C.SURNAME AS CUSTOMER,
    I.EMPLOYEE_ID,
    D.DELIVERY_NOTES,
    N.DONATION,
    I.INVOICE_NUM,
    I.INVOICE_DATE
FROM 
    CUSTOMER C
    JOIN INVOICE I ON C.CUSTOMER_ID = I.CUSTOMER_ID
    JOIN DELIVERY D ON I.DELIVERY_ID = D.DELIVERY_ID
    JOIN DONATION N ON I.DONATION_ID = N.DONATION_ID
WHERE 
    I.INVOICE_DATE > TO_DATE('16-MAY-2024', 'DD-MON-YYYY');

--q3

CREATE TABLE FUNDING (
    FUNDING_ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    FUNDER VARCHAR(100),
    FUNDING_AMOUNT DECIMAL(10, 2)
);


INSERT INTO FUNDING (FUNDER, FUNDING_AMOUNT) VALUES ('National Trust', 5000);
INSERT INTO FUNDING (FUNDER, FUNDING_AMOUNT) VALUES ('Charity Organization A', 1200);


--q4
SET SERVEROUTPUT ON;
BEGIN
    FOR rec IN (
        SELECT C.FIRST_NAME || ', ' || C.SURNAME AS CUSTOMER,
               N.DONATION,
               N.PRICE,
               R.REASON
        FROM RETURNS R
        JOIN CUSTOMER C ON R.CUSTOMER_ID = C.CUSTOMER_ID
        JOIN DONATION N ON R.DONATION_ID = N.DONATION_ID
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE('CUSTOMER: ' || rec.CUSTOMER);
        DBMS_OUTPUT.PUT_LINE('DONATION PURCHASED: ' || rec.DONATION);
        DBMS_OUTPUT.PUT_LINE('PRICE: ' || rec.PRICE);
        DBMS_OUTPUT.PUT_LINE('RETURN REASON: ' || rec.REASON);
        DBMS_OUTPUT.PUT_LINE('-----------------------------------');
    END LOOP;
END;


--q5
SET SERVEROUTPUT ON;
BEGIN
    FOR rec IN (
        SELECT C.FIRST_NAME || ', ' || C.SURNAME AS CUSTOMER,
               E.FIRST_NAME || ', ' || E.SURNAME AS EMPLOYEE,
               N.DONATION,
               D.DISPATCH_DATE,
               D.DELIVERY_DATE,
               (D.DELIVERY_DATE - D.DISPATCH_DATE) AS DAYS_TO_DELIVERY
        FROM CUSTOMER C
        JOIN INVOICE I ON C.CUSTOMER_ID = I.CUSTOMER_ID
        JOIN EMPLOYEE E ON I.EMPLOYEE_ID = E.EMPLOYEE_ID
        JOIN DELIVERY D ON I.DELIVERY_ID = D.DELIVERY_ID
        JOIN DONATION N ON I.DONATION_ID = N.DONATION_ID
        WHERE C.CUSTOMER_ID = 11011
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE('CUSTOMER: ' || rec.CUSTOMER);
        DBMS_OUTPUT.PUT_LINE('EMPLOYEE: ' || rec.EMPLOYEE);
        DBMS_OUTPUT.PUT_LINE('DONATION: ' || rec.DONATION);
        DBMS_OUTPUT.PUT_LINE('DISPATCH DATE: ' || rec.DISPATCH_DATE);
        DBMS_OUTPUT.PUT_LINE('DELIVERY DATE: ' || rec.DELIVERY_DATE);
        DBMS_OUTPUT.PUT_LINE('DAYS TO DELIVERY: ' || rec.DAYS_TO_DELIVERY);
        DBMS_OUTPUT.PUT_LINE('-----------------------------------');
    END LOOP;
END;


--q6
SET SERVEROUTPUT ON;
BEGIN
    FOR rec IN (
        SELECT C.FIRST_NAME || ', ' || C.SURNAME AS CUSTOMER,
               SUM(N.PRICE) AS TOTAL_SPENT,
               CASE 
                   WHEN SUM(N.PRICE) >= 1500 THEN '***'
                   WHEN SUM(N.PRICE) BETWEEN 1000 AND 1499 THEN '**'
                   ELSE '*' 
               END AS CUSTOMER_RATING
        FROM CUSTOMER C
        JOIN INVOICE I ON C.CUSTOMER_ID = I.CUSTOMER_ID
        JOIN DONATION N ON I.DONATION_ID = N.DONATION_ID
        GROUP BY C.FIRST_NAME, C.SURNAME
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE('CUSTOMER: ' || rec.CUSTOMER);
        DBMS_OUTPUT.PUT_LINE('TOTAL AMOUNT: R' || rec.TOTAL_SPENT);
        DBMS_OUTPUT.PUT_LINE('CUSTOMER RATING: ' || rec.CUSTOMER_RATING);
        DBMS_OUTPUT.PUT_LINE('-----------------------------------');
    END LOOP;
END;


--q7.1
SET SERVEROUTPUT ON;
DECLARE
   -- We are declaring a variable that will store the customers first name, using %TYPE to reference the column's data type
   v_customer_firstname CUSTOMER.FIRST_NAME%TYPE;
   v_customer_id CUSTOMER.CUSTOMER_ID%TYPE := 11011; -- We are assigning a customer ID
BEGIN
   -- we are select the customer's first name from the CUSTOMER table
   SELECT FIRST_NAME INTO v_customer_firstname
   FROM CUSTOMER
   WHERE CUSTOMER_ID = v_customer_id;
   
   --This is the output the customer's first name
   DBMS_OUTPUT.PUT_LINE('Customer First Name: ' || v_customer_firstname);
END;
/

--q7.2
SET SERVEROUTPUT ON;
DECLARE
   -- We are declare a record to store the entire row from the CUSTOMER table
   v_customer_rec CUSTOMER%ROWTYPE;
   v_customer_id CUSTOMER.CUSTOMER_ID%TYPE := 11011; -- We are assigning a customer ID
BEGIN
   -- This will select an entire row for the given customer ID into the record
   SELECT * INTO v_customer_rec
   FROM CUSTOMER
   WHERE CUSTOMER_ID = v_customer_id;
   
   --this is the output customer details using the record fields
   DBMS_OUTPUT.PUT_LINE('Customer Details: ' || v_customer_rec.FIRST_NAME || ' ' || v_customer_rec.SURNAME);
   DBMS_OUTPUT.PUT_LINE('Address: ' || v_customer_rec.ADDRESS);
   DBMS_OUTPUT.PUT_LINE('Contact Number: ' || v_customer_rec.CONTACT_NUMBER);
END;
/

--q7.3
SET SERVEROUTPUT ON;
DECLARE
   --We are declaring a custom exception for when the donation amount is too high
   e_donation_too_high EXCEPTION;
   v_donation_price DONATION.PRICE%TYPE;
   v_donation_id DONATION.DONATION_ID%TYPE := 7113; -- We are assigning a donation ID

   -- We are setting a limit for the maximum acceptable donation price
   MAX_DONATION_PRICE CONSTANT NUMBER := 1500;
BEGIN
   -- This will select the donation price from the DONATION table
   SELECT PRICE INTO v_donation_price
   FROM DONATION
   WHERE DONATION_ID = v_donation_id;

   -- This is checking if the donation price exceeds the maximum allowed price
   IF v_donation_price > MAX_DONATION_PRICE THEN
      RAISE e_donation_too_high; -- Raise the custom exception
   END IF;

   --This will output the donation price
   DBMS_OUTPUT.PUT_LINE('Donation Price: ' || v_donation_price);

EXCEPTION
   -- This is for handling the custom exception when the donation price is too high
   WHEN e_donation_too_high THEN
      DBMS_OUTPUT.PUT_LINE('Error: Donation price exceeds the allowed maximum of ' || MAX_DONATION_PRICE);
END;
/

--q8
SELECT 
    C.FIRST_NAME || ', ' || C.SURNAME AS CUSTOMER,
    SUM(N.PRICE) AS AMOUNT,
    CASE 
        WHEN SUM(N.PRICE) >= 1500 THEN '***'
        WHEN SUM(N.PRICE) BETWEEN 1000 AND 1499 THEN '**'
        ELSE '*' 
    END AS CUSTOMER_RATING
FROM 
    CUSTOMER C
    JOIN INVOICE I ON C.CUSTOMER_ID = I.CUSTOMER_ID
    JOIN DONATION N ON I.DONATION_ID = N.DONATION_ID
GROUP BY 
    C.FIRST_NAME, C.SURNAME;
