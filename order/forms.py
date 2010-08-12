from django import forms

class DeliveryForm(forms.Form):
    delivery_address = forms.CharField(widget=forms.Textarea)
