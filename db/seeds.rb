# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

    categories = Category.create([
        {name: "Grains"},
        {name: "Pulses"},
        {name: "Spices"},
        {name: "Snakcs"},
        {name: "Condiments"},
        {name: "Dried Fruits and Nuts"},
        {name: "Misc"}
    ])
    units = Unit.create([
        {name: "lbs", equivalent_weight_in_grams: 440 },
        {name: "oz", equivalent_weight_in_grams: 28 },
        {name: "kgs",equivalent_weight_in_grams: 1000 },
        {name: "count"},
        {name: "grams",equivalent_weight_in_grams: 1 }
    ])

    ingredients = Ingredient.create([
        {name: 'Rice',
        categories_id: Category.find_by(name: "Grains").id,
        quantity: 10,
        units_id: Unit.find_by(name: "lbs"),
        status: 2},
        {name: 'Arhar Dal',
        categories_id: Category.find_by(name: "Pulses").id,
        quantity: 5,
        units_id: Unit.find_by(name: "lbs"),
        status: 2},
        {name: 'Salt',
        categories_id: Category.find_by(name: "Spices").id,
        quantity: 1,
        units_id: Unit.find_by(name: "lbs"),
        status: 3}
    ])
    
