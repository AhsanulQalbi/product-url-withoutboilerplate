const Sequelize = require('sequelize')
const db = require('../connection');

const Product = db.define("products",
    {
        id : {
            type : Sequelize.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },

        name : {
            type : Sequelize.STRING,
        },

        price : {
            type : Sequelize.BIGINT,
        },

        description : {
            type : Sequelize.STRING
        },

        vendor_id: {
            type: Sequelize.INTEGER,
            references: {
                model: 'vendors',
                key: 'id'
            } 
        },

        picture : {
            type : Sequelize.STRING,
        },
    },
    {
        
    }
);

const Vendor = db.define("vendors",
    {
        id : {
            type : Sequelize.INTEGER,
            autoIncrement: true,
            primaryKey: true
        }, 

        fullname : {
            type : Sequelize.STRING,
            allowNull : false
        },
        email : {
            type : Sequelize.STRING,
            allowNull : false,
            unique: true
        },

        phone : {
            type : Sequelize.STRING,
            allowNull : false
        },
    },
    {
        
    }
);


const Address = db.define("addresses",
    {
        id : {
            type : Sequelize.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        street : {
            type : Sequelize.STRING,

        },
        user_id :{
            type : Sequelize.INTEGER,
            allowNull : false
        },
        city : {
            type : Sequelize.STRING,

        },
        province : {
            type : Sequelize.STRING,

        },
        country : {
            type : Sequelize.STRING,

        },
        postal_code : {
            type : Sequelize.STRING,

        }
    },
    {
        
    }
);


const Category = db.define("categories",
    {
        id : {
            type : Sequelize.INTEGER,
            autoIncrement: true,
            primaryKey: true
        }, 

        name : {
            type : Sequelize.STRING,
            allowNull : false
        },
        
        product_id: {
            type : Sequelize.INTEGER,
            allowNull : false,
        },
    },
    {
        
    }
);


Vendor.hasOne(Address, {
    foreignKey: 'user_id',
    foreignKeyConstraint: true 
});
      

Vendor.hasMany(Product,{
    onDelete : "cascade",
    foreignKey: 'vendor_id', 
    foreignKeyConstraint: true   
});

Category.hasMany(Product,{
    onDelete : "cascade",
    foreignKey: 'product_id', 
    foreignKeyConstraint: true 
})


module.exports = {
    product: Product,
    address: Address,
    vendor : Vendor
};