# Znuny Vulnerability Disclosure Policy

We take the security of our systems seriously, and we value the security community.
The disclosure of security vulnerabilities helps us ensure the security and privacy of our users.

## Guidelines

We require that all researchers:

- Respect the rules. Operate within the rules set, or speak up if in strong
disagreement with the rules.
- Respect privacy. Make a good faith effort not to access or destroy
another user's data. Avoid degradation of user experience, disruption to
production systems, and destruction of data.
- Be patient. Make a good faith effort to clarify and support on
arising questions. Keep information about any vulnerabilities you’ve
discovered confidential between yourself and Znuny until we
resolved the issue with a public Znuny Security Announcement (we plan
to do so within 60 days)
- Do no harm. Act for the common good through the prompt reporting of
all found vulnerabilities. Never willfully exploit others without their
permission.
- Use the communication channel below to report vulnerability
information to us. Do not use personal emails, social media accounts, or
other private connections to contact a member of a security team in
regards to vulnerabilities or any program related issues, unless you
have been instructed to do so.

If you follow these guidelines when reporting an issue to us, we commit to:
- Not pursue or support any legal action related to your research;
- Work with you to understand and resolve the issue quickly (including
an initial confirmation of your report within 1 week of submission);
- Recognize your contribution, if you are the first to report the issue
and we make a code or configuration change based on the issue.

## Scope

- Znuny and features created or forked by Znuny
- ((OTRS)) Community Edition 6 and open-source features created by the OTRS Group
- Managed Znuny instances and any tools created or operated by Znuny

### Out of scope

Any services hosted by 3rd party providers and services are excluded
from scope. These services include instances hosted by external
parties and forks of Znuny or the ((OTRS)) Community Edition.

## Supported Versions

The following list shows Znuny versions with their support status for security updates and if they have known vulnerabilities.
Please see the [Roadmap](https://www.znuny.org/en/roadmap) for an EOL overview.

| Version | Supported          | Known vulnerabilities    |
| ------- | ------------------ |------------------------- |
| 6.0     | :x:                | -                        |
| 6.1     | :x:                | :heavy_exclamation_mark: |
| 6.2     | :x:                | :heavy_exclamation_mark: |
| 6.3     | :x:                | -                        |
| 6.4     | :x:                | -                        |
| 6.5 LTS | :heavy_check_mark: | -                        |
| 7.0     | :x:                | -                        |
| 7.1     | :heavy_check_mark: | -                        |

## How to report a security vulnerability?

If you believe you’ve found a security vulnerability in one of our
products or platforms please send it to us by emailing
security@znuny.org. Please include the following details with your report:

- Description of the location and potential impact of the vulnerability;
- A detailed description of the steps required to reproduce the
vulnerability (PoC scripts, screenshots, and compressed screen captures
are all helpful to us); and
- Your name/pseudonym for recognition of your contribution. If you prefer
to remain anonymous, we encourage them to submit under a pseudonym.
