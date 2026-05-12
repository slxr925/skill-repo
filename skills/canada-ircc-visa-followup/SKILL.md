---
name: canada-ircc-visa-followup
description: Use when helping a user check or follow up on delayed Canadian IRCC temporary resident visa, visitor visa, study permit, work permit, or other immigration application status, especially when preparing or submitting an IRCC Web form inquiry. Handles English form navigation, current processing-time checks, privacy-safe data collection, draft wording, review, consent, and final-submission confirmation.
metadata:
  short-description: Follow up delayed Canadian IRCC applications
---

# Canada IRCC Visa Follow-Up

Use this skill for Canadian IRCC application delay/status tasks, especially visitor visa or temporary resident visa cases where the user wants help in English.

## Ground Rules

- Treat this as procedural assistance, not legal advice.
- Use official IRCC pages for current processing times, Web form routes, and status wording. These change; verify live before making a recommendation.
- Do not expose personal identifiers in summaries unless needed. Prefer redaction for UCI, passport number, email, application number, date of birth, and full name.
- Before entering personal data into an external IRCC form, clearly confirm what will be entered and get user permission.
- Before clicking the final submit button, stop at the review page and ask for explicit confirmation.
- Never invent missing identifiers. If a required field is missing, ask the user or read it from the user's IRCC page if they authorized browser access.

## Workflow

1. **Identify the case**
   - Application type, e.g. Visitor visa / Temporary Resident Visa.
   - Submission date and current account status.
   - Application number, UCI, biometrics status, messages, requests, eligibility, and background check status if visible.

2. **Assess delay**
   - Check current IRCC processing time from official IRCC sources for the application type and country/location.
   - Compare the processing-time estimate with the actual elapsed time.
   - If the case is over normal processing time and no action request is visible, recommend IRCC Web form follow-up.

3. **Open the correct route**
   - Use the official IRCC Web form or "Update or ask about your application" route.
   - Select the user as principal applicant when appropriate.
   - For visitor visas, typical category choices are:
     - `Temporary Residence`
     - `Temporary Resident Visa`
     - Submitted online if the IRCC account shows online submission.

4. **Collect only required data**
   - Full name as shown on the application.
   - Email and email confirmation.
   - Date of birth.
   - Country/territory of birth.
   - Country/territory of residence when submitted.
   - Passport number and issuing country if required.
   - Application number and/or UCI.
   - Confirm consent/disclaimer language before checking consent boxes.

5. **Draft the inquiry**
   - Keep it concise, factual, and non-accusatory.
   - Include application type, submission date, current status, current official processing time if verified, and lack of messages/request letters if true.
   - Ask IRCC to confirm whether the application remains active and whether the applicant must provide anything or take any action.
   - Use [references/webform-templates.md](references/webform-templates.md) for sample wording.

6. **Review and submit**
   - Fill the form carefully. If the site blocks paste in email confirmation fields, type manually or simulate typing.
   - On the review page, summarize key fields and the message for the user.
   - Ask the user to reply with an explicit phrase like `确认提交`.
   - After submission, capture the confirmation wording and tell the user which email inbox to monitor.

## Browser Handling

If using Chrome or browser automation:

- Read page status before acting.
- Avoid stale pages when IRCC forms become unresponsive; prefer opening a fresh official Web form tab.
- Do not submit forms, delete files, withdraw applications, or upload documents without explicit confirmation.
- If a session contains personal information, keep final summaries short and avoid repeating sensitive data.

## Useful Chinese Phrases

- "这一步会把你的个人信息发送给 IRCC，我需要你确认后再继续。"
- "我会停在 review 页面，不会直接最终提交。"
- "如果确认无误，请回复：`确认提交`。"
- "提交后请留意邮箱，包括垃圾邮件/广告邮件文件夹。"
