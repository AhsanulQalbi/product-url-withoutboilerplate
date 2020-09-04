const express = require('express');
const bodyParser = require('body-parser');
const {product, address, vendor} = require('./models/models.js');

var urlencodedParser = bodyParser.urlencoded({extended: false});
var fileUploader = require('express-fileupload');

var app = express();

app.set('view engine', 'ejs');
app.use(fileUploader())
app.use(bodyParser.json());
app.use('/assets', express.static('assets'));
app.use('/uploads', express.static('uploads'));


app.get('/api/getAllProduct', async function(req,res){
    try{
        const getAllProduct = await product.findAll({
        });
        res.json(getAllProduct);
    }
    catch(err)
    {
        console.error(err.message);
        res.status(500).send('error');
    }
});

app.get('/api/getAllVendor', async function(req,res){
    try{
        const getAllVendor = await vendor.findAll({
        });
        res.json(getAllVendor);
    }
    catch(err)
    {
        console.error(err.message);
        res.status(500).send('error');
    }
});


app.get('/api/getProduct', async function(req,res){
    try{
        const id = req.params.id
        const getProduct = await product.findOne({
        },{where : {id : id}});
        res.json(getProduct);
    }
    catch(err)
    {
        console.error(err.message);
        res.status(500).send('error');
    }
});


app.get('/api/getVendor', async function(req,res){
    try{
        const id = req.params.id
        const getVendor = await vendor.findOne({
        },{where : {id : id}});
        res.json(getVendor);
    }
    catch(err)
    {
        console.error(err.message);
        res.status(500).send('error');
    }
});

app.post('/api/postProduct',urlencodedParser,async function(req,res) {
    try
    {
        var {name, price, description, vendor_id, picture} = req.body;
        picture = req.files.picture.name;
        const pictureFile = req.files.picture;
        const newProduct = new product({
            name, price, description, vendor_id, picture
        });

        await newProduct.save();
      

        pictureFile.mv('./uploads/' + picture, function(err,result){
            if(err)
            {
                console.error(err.message);
            }
            res.json(newProduct);
        })
    }
    catch(err)
    {
        console.error(err.message);
        res.status(500).send('error');
    }
});



app.post('/api/postVendor',urlencodedParser,async function(req,res) {
    try
    {
        const {fullname, email, phone} = req.body;
        
        const newVendor = new vendor({
            fullname, email, phone
        });

        await newVendor.save();
        res.json(newVendor);

       
    }
    catch(err)
    {
        console.error(err.message);
        res.status(500).send('error');
    }
});


// app.post('/api/deleteAnEmployee', urlencodedParser, async function(req,res){
//     try{
//         const username = req.body.username;
//         const deleteEmployee = await employee.destroy({
//             where : {username : username}
//         });

//         await deleteEmployee;
//         res.redirect('/employee_list');
//     }
//     catch(err)
//     {
//         console.error(err.message);
//         res.status(500).send('error');
//     }  
// })

app.listen(3000);