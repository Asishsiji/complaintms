# Generated by Django 3.2.2 on 2024-05-10 16:56

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('ComplaintMS', '0007_profile_first_name'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='profile',
            name='first_name',
        ),
    ]
