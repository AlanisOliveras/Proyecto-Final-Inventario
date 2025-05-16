from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField, TextAreaField, SelectField, IntegerField, DecimalField, DateField
from wtforms.validators import DataRequired, Email, EqualTo, Length, NumberRange

# Formulario para login de usuario
class LoginForm(FlaskForm):
    email = StringField('Email', validators=[DataRequired(), Email()])
    password = PasswordField('Password', validators=[DataRequired()])
    submit = SubmitField('Login')

# Formulario para registrar un nuevo usuario
class RegisterForm(FlaskForm):
    username = StringField('Username', validators=[DataRequired()])
    email = StringField('Email', validators=[DataRequired(), Email()])
    password = PasswordField('Password', validators=[DataRequired()])
    confirm_password = PasswordField('Confirm password', validators=[DataRequired(), EqualTo('password')])
    
    role = SelectField(
        'Role',
        choices=[('Admin', 'Admin'), ('User', 'User'), ('Owner', 'Owner')],
        validators=[DataRequired()]
    )

    submit = SubmitField('Register')

# Formulario para cambiar la contraseña del usuario
class ChangePasswordForm(FlaskForm):
    old_password = PasswordField('Current password', validators=[DataRequired()])
    new_password = PasswordField('New password', validators=[DataRequired(), Length(min=6)])
    confirm_password = PasswordField('Confirm new password', validators=[DataRequired(), EqualTo('new_password')])
    submit = SubmitField('Update Password')

# Formulario para crear o editar un ítem del inventario
class ItemForm(FlaskForm):
    nombre =StringField('Nombre del ítem', validators=[DataRequired()])
    categoria =StringField('Categoría', validators=[DataRequired()])
    cantidad =IntegerField('Cantidad', validators=[DataRequired()])
    precio_estimado=DecimalField('Precio Estimado', validators=[DataRequired()])
    ubicacion= StringField('Ubicación', validators=[DataRequired()])
    fecha_adquisicion= DateField('Fecha de Adquisición', validators=[DataRequired()])
    submit = SubmitField('Save')
