
<strong><strong>Tech stack used: Node js, Mysql</strong></strong><br>

Github link- :https://github.com/manojkumar0100/flex <br>

For Backend Api's please check published postman Api documentation: <br>
https://documenter.getpostman.com/view/31925166/2s9Ykq8Lyc



<strong><strong><strong>API EndPoints</strong></strong></strong> <br> 
router.post('/login', authController.loginController);<br> 
router.post('/register', authController.registerController);<br> 
router.post('/payment',authMiddleware.requireSignIn,authController.payment);<br> 
router.get('/getAllBatches',authController.getAllBatch);<br> 
router.get('/checkEnrollment',authMiddleware.requireSignIn,authController.checkEnrollment);<br> 
router.get('/getuserdata',authMiddleware.requireSignIn,authController.userdata);<br> 

<strong><strong><strong>Functionalities</strong></strong></strong> <br> 
1)payment is done using completePayment function in completePayment.js <br> 
2)Age restriction is set and it validates during payment  <br> 
3)flexibilty of database is available <br> 
4)Jwt Authentication is used and middlewares are written to check the authenticity of the user  <br> 


