function validate() {
      
        if(document.signup.password.value !== document.signup.repassword.value ) {
            alert( "Password and Re-type are not the same!" );
            document.signup.password.focus() ;
            document.signup.repassword.focus() ;
            return false;
         }

         return( true );
      }