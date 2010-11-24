from django.core.mail import EmailMultiAlternatives
from django.template.loader import render_to_string
from django.utils.html import strip_tags

def send_notification(subject, sender, mail_template, *recipients, **context_vars):
    """
	Send email notification to recipients using mail_template, replacing context variables with context_vars.
    """
    html_content = render_to_string(mail_template, context_vars)
    text_content = strip_tags(html_content)

    message = EmailMultiAlternatives(subject, text_content, sender, recipients)
    message.attach_alternative(html_content, "text/html")

    try:
	message.send()
    except Exception, e:
	return False

    return True
