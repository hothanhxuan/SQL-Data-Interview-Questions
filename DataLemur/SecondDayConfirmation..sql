SELECT 
      e.user_id
      -- ,e.email_id
      -- ,e.signup_date
      -- ,t.signup_action
      -- ,t.action_date
FROM emails AS e 
INNER JOIN texts AS t 
ON e.email_id = t.email_id
WHERE e.signup_date != t.action_date 
GROUP BY e.user_id, e.signup_date, t.action_date 
HAVING (action_date::date) - (signup_date::date) = 1
ORDER BY e.user_id

-- Assume you're given tables with information about TikTok user sign-ups and confirmations through email and text. 
-- New users on TikTok sign up using their email addresses, and upon sign-up, each user receives a text message confirmation to activate their account.

-- Write a query to display the user IDs of those who did not confirm their sign-up on the first day, but confirmed on the second day.

-- Definition:
-- action_date refers to the date when users activated their accounts and confirmed their sign-up through text messages.
