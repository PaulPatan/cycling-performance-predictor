function initializeValidations() {
    const emailPattern = /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
    const passwordPattern = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,30}$/;

    const validateField = (field, pattern, message) => {
        if (pattern.test(field.value)) {
            field.style.outline = '2px solid green';
            message.style.display = 'none';
        } else {
            field.style.outline = '2px solid red';
            message.style.display = 'block';
        }
    };

    const validatePasswordConfirmation = (passwordField, confirmPasswordField, message) => {
        if (passwordField.value === confirmPasswordField.value && passwordField.value !== "") {
            confirmPasswordField.style.outline = '2px solid green';
            message.style.display = 'none';
        } else {
            confirmPasswordField.style.outline = '2px solid red';
            message.style.display = 'block';
        }
    };

    const loginForm = document.querySelector('form#new_user');
    const emailField = document.querySelector('#user_email');
    const passwordField = document.querySelector('#user_password');

    if (loginForm && emailField && passwordField) {
        let emailMessage = emailField.nextElementSibling;
        if (!emailMessage || !emailMessage.classList.contains('validation-message')) {
            emailMessage = document.createElement('div');
            emailMessage.classList.add('validation-message');
            emailMessage.style.color = 'red';
            emailMessage.textContent = 'Please enter a valid email address.';
            emailMessage.style.display = 'none';
            emailField.parentNode.insertBefore(emailMessage, emailField.nextSibling);
        }

        let passwordMessage = passwordField.nextElementSibling;
        if (!passwordMessage || !passwordMessage.classList.contains('validation-message')) {
            passwordMessage = document.createElement('div');
            passwordMessage.classList.add('validation-message');
            passwordMessage.style.color = 'red';
            passwordMessage.textContent = 'Password must contain at least one uppercase letter, one lowercase letter, one number, one special character, and be between 8 and 30 characters long.';
            passwordMessage.style.display = 'none';
            passwordField.parentNode.insertBefore(passwordMessage, passwordField.nextSibling);
        }

        const confirmPasswordField = document.querySelector('#user_password_confirmation');

        if (confirmPasswordField) {
            // Sign Up Form
            let confirmPasswordMessage = confirmPasswordField.nextElementSibling;
            if (!confirmPasswordMessage || !confirmPasswordMessage.classList.contains('validation-message')) {
                confirmPasswordMessage = document.createElement('div');
                confirmPasswordMessage.classList.add('validation-message');
                confirmPasswordMessage.style.color = 'red';
                confirmPasswordMessage.textContent = 'Passwords do not match.';
                confirmPasswordMessage.style.display = 'none';
                confirmPasswordField.parentNode.insertBefore(confirmPasswordMessage, confirmPasswordField.nextSibling);
            }

            emailField.addEventListener('input', function() {
                validateField(emailField, emailPattern, emailMessage);
            });

            passwordField.addEventListener('input', function() {
                validateField(passwordField, passwordPattern, passwordMessage);
                validatePasswordConfirmation(passwordField, confirmPasswordField, confirmPasswordMessage);
            });

            confirmPasswordField.addEventListener('input', function() {
                validatePasswordConfirmation(passwordField, confirmPasswordField, confirmPasswordMessage);
            });

            loginForm.addEventListener('submit', function(event) {
                if (!emailPattern.test(emailField.value) || !passwordPattern.test(passwordField.value) || passwordField.value !== confirmPasswordField.value) {
                    event.preventDefault();
                    alert('Please ensure all fields are correctly filled out.');
                }
            });
        } else {
            // Login Form
            emailField.addEventListener('input', function() {
                validateField(emailField, emailPattern, emailMessage);
            });

            passwordField.addEventListener('input', function() {
                validateField(passwordField, passwordPattern, passwordMessage);
            });

            loginForm.addEventListener('submit', function(event) {
                if (!emailPattern.test(emailField.value) || !passwordPattern.test(passwordField.value)) {
                    event.preventDefault();
                    alert('Please ensure all fields are correctly filled out.');
                }
            });
        }
    }
}

document.addEventListener('turbo:load', initializeValidations);
document.addEventListener('DOMContentLoaded', initializeValidations);
