# Generated by Django 3.2.2 on 2024-05-10 15:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ComplaintMS', '0003_auto_20240331_1056'),
    ]

    operations = [
        migrations.AddField(
            model_name='complaint',
            name='first_name',
            field=models.CharField(max_length=30, null=True),
        ),
    ]
