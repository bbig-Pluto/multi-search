DELIMITER //
CREATE PROCEDURE sp_insert_member(
    IN p_name VARCHAR(20),
    IN p_email VARCHAR(50),
    IN p_picture VARCHAR(200),
    IN p_role VARCHAR(20),
    IN p_registration_id VARCHAR(30),
    IN p_provider_token VARCHAR(255),
    OUT p_member_id BIGINT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET p_member_id = NULL;
    END;

    START TRANSACTION;

    INSERT INTO member
        (
            name,
            account,
            password,
            email,
            phone_number,
            picture,
            birth_date,
            use_yn,
            cert_yn,
            role,
            create_date,
            update_date,
            gender
        )
    VALUES
        (
            p_name,
            NULL,
            NULL,
            p_email,
            NULL,
            IFNULL(p_picture, NULL),
            NULL,
            'Y',
            'Y',
            p_role,
            NOW(),
            NOW(),
            NULL
        );

    SET p_member_id = LAST_INSERT_ID();

    INSERT INTO social_member
        (
            member_id,
            provider_type,
            provider_token
        )
    VALUES
        (
            LAST_INSERT_ID(),
            p_registration_id,
            p_provider_token
        );

    COMMIT;
END //
DELIMITER ;