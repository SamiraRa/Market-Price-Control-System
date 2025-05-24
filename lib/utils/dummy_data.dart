class DemoData {
  static const products = '''[
    {
      "category": "Fruits & Vegetables",
      "sub_category_list": [
        {
          "sub_category_name": "Leafy Greens (শাক)",
          "item_list": [
            {
              "item_name": "পুঁই শাক (Malabar Spinach)",
              "item_id": "LG001",
              "item_details": "Fresh Indian spinach, ideal for curries.",
              "item_quantity": "1 bundle",
              "item_weight": "250g",
              "item_price": "25 BDT",
              "batch_date": "06-08-2025",
              "item_image_path": "",
              "exp_date":
                 "06-08-2025"
            },
            {
              "item_name": "পালং শাক (Spinach)",
              "item_id": "LG002",
              "item_details": "Rich in iron, great for soups and bhaji.",
              "item_quantity": "1 bundle",
              "item_weight": "300g",
              "item_price": "30 BDT",
              "item_image_path": "",
              "batch_date": "06-08-2025",
              "exp_date":
                 "06-08-2025"
            },
            {
              "item_name": "লাল শাক (Red Amaranth)",
              "item_id": "LG003",
              "item_details": "Bright red leaves, lightly earthy taste.",
              "item_quantity": "1 bundle",
              "item_weight": "200g",
              "item_price": "22 BDT",
              "item_image_path": "",
              "batch_date": "06-08-2025",
              "exp_date":
                 "06-08-2025"
            },
            {
              "item_name": "কলমি শাক (Water Spinach)",
              "item_id": "LG004",
              "item_details": "Tender hollow stems, perfect stir-fried.",
              "item_quantity": "1 bundle",
              "item_weight": "300g",
              "item_price": "28 BDT",
              "item_image_path": "",
              "batch_date": "06-08-2025",
              "exp_date":
                 "06-08-2025"
            },
            {
              "item_name": "সরিষা শাক (Mustard Leaf)",
              "item_id": "LG005",
              "item_details": "Spicy and peppery leaves, great in mash.",
              "item_quantity": "1 bundle",
              "item_weight": "250g",
              "item_price": "24 BDT",
              "item_image_path": "",
              "batch_date": "06-08-2025",
              "exp_date":
                 "06-08-2025"
            },
            {
              "item_name": "ঢেঁকি শাক (Edible Fern)",
              "item_id": "LG006",
              "item_details": "Wild forest fern, soft when cooked.",
              "item_quantity": "1 bundle",
              "item_weight": "200g",
              "item_price": "26 BDT",
              "item_image_path": "",
              "batch_date": "06-08-2025",
              "exp_date":
                 "06-08-2025"
            },
            {
              "item_name": "পাট শাক (Jute Leaves)",
              "item_id": "LG007",
              "item_details": "Sticky texture when cooked, good for soup.",
              "item_quantity": "1 bundle",
              "item_weight": "250g",
              "item_price": "20 BDT",
              "item_image_path": "",
              "batch_date": "06-08-2025",
              "exp_date":
                 "06-08-2025"
            },
            {
              "item_name": "কচু শাক (Taro Stem)",
              "item_id": "LG008",
              "item_details": "Fibrous and earthy, needs proper cooking.",
              "item_quantity": "1 bundle",
              "item_weight": "300g",
              "item_price": "27 BDT",
              "item_image_path": "",
              "batch_date": "06-08-2025",
              "exp_date":
                 "06-08-2025"
            },
            {
              "item_name": "মূলা শাক (Radish Leaves)",
              "item_id": "LG009",
              "item_details": "Sharp, peppery leaves, good for mash.",
              "item_quantity": "1 bundle",
              "item_weight": "200g",
              "item_price": "18 BDT",
              "item_image_path": "",
              "batch_date": "06-08-2025",
              "exp_date":
                 "06-08-2025"
            },
            {
              "item_name": "লাউ শাক (Bottle Gourd Leaf)",
              "item_id": "LG010",
              "item_details": "Soft green leaves of bottle gourd.",
              "item_quantity": "1 bundle",
              "item_weight": "250g",
              "item_price": "20 BDT",
              "item_image_path": "",
              "batch_date": "06-08-2025",
              "exp_date":
                 "06-08-2025"
            },
            {
              "item_name": "কুমড়ো শাক (Sweet Gourd Leaf)",
              "item_id": "LG011",
              "item_details": "Sweeter leaf, mild in taste, great with prawns.",
              "item_quantity": "1 bundle",
              "item_weight": "250g",
              "item_price": "23 BDT",
              "item_image_path": "",
              "batch_date": "06-08-2025",
              "exp_date":
                 "06-08-2025"
            },
            {
              "item_name": "গিমা শাক (Kangkong)",
              "item_id": "LG012",
              "item_details": "Highly nutritious aquatic vegetable.",
              "item_quantity": "1 bundle",
              "item_weight": "300g",
              "item_price": "29 BDT",
              "item_image_path": "",
              "batch_date": "06-08-2025",
              "exp_date":
                 "06-08-2025"
            },
            {
              "item_name": "ডাটা শাক (Stem Amaranth)",
              "item_id": "LG013",
              "item_details": "Thick, crunchy stems and leafy top.",
              "item_quantity": "1 bundle",
              "item_weight": "250g",
              "item_price": "21 BDT",
              "item_image_path": "",
              "batch_date": "06-08-2025",
              "exp_date":
                 "06-08-2025"
            }
          ]
        },
        {"sub_category_name": "Root Vegetables", "item_list": []},
        {"sub_category_name": "Fruit Vegetables", "item_list": []},
        {"sub_category_name": "Pods & Beans", "item_list": []}
      ]
    }
  ]''';

  static const productList = '''
[
  {
    "category": "Vegetables",
    "sub_category_list": [
      {
        "sub_category": "Leafy Greens",
        "item_list": [
          {
            "item_name": "পুঁই শাক (Malabar Spinach)",
            "item_id": "LG001",
            "item_details": "Fresh Indian spinach, ideal for curries.",
            "item_quantity": "1 bundle",
            "item_weight": "250g",
            "item_price": "25 BDT",
            "batch_date": "06-08-2025",
            "item_image_path": "",
            "exp_date": "06-08-2025"
          },
          {
            "item_name": "পালং শাক (Spinach)",
            "item_id": "LG002",
            "item_details": "Rich in iron, great for soups and bhaji.",
            "item_quantity": "1 bundle",
            "item_weight": "300g",
            "item_price": "30 BDT",
            "item_image_path": "",
            "batch_date": "06-08-2025",
            "exp_date": "06-08-2025"
          },
          {
            "item_name": "লাল শাক (Red Amaranth)",
            "item_id": "LG003",
            "item_details": "Bright red leaves, lightly earthy taste.",
            "item_quantity": "1 bundle",
            "item_weight": "200g",
            "item_price": "22 BDT",
            "item_image_path": "",
            "batch_date": "06-08-2025",
            "exp_date": "06-08-2025"
          },
          {
            "item_name": "কলমি শাক (Water Spinach)",
            "item_id": "LG004",
            "item_details": "Tender hollow stems, perfect stir-fried.",
            "item_quantity": "1 bundle",
            "item_weight": "300g",
            "item_price": "28 BDT",
            "item_image_path": "",
            "batch_date": "06-08-2025",
            "exp_date": "06-08-2025"
          },
          {
            "item_name": "সরিষা শাক (Mustard Leaf)",
            "item_id": "LG005",
            "item_details": "Spicy and peppery leaves, great in mash.",
            "item_quantity": "1 bundle",
            "item_weight": "250g",
            "item_price": "24 BDT",
            "item_image_path": "",
            "batch_date": "06-08-2025",
            "exp_date": "06-08-2025"
          },
          {
            "item_name": "ঢেঁকি শাক (Edible Fern)",
            "item_id": "LG006",
            "item_details": "Wild forest fern, soft when cooked.",
            "item_quantity": "1 bundle",
            "item_weight": "200g",
            "item_price": "26 BDT",
            "item_image_path": "",
            "batch_date": "06-08-2025",
            "exp_date": "06-08-2025"
          },
          {
            "item_name": "পাট শাক (Jute Leaves)",
            "item_id": "LG007",
            "item_details": "Sticky texture when cooked, good for soup.",
            "item_quantity": "1 bundle",
            "item_weight": "250g",
            "item_price": "20 BDT",
            "item_image_path": "",
            "batch_date": "06-08-2025",
            "exp_date": "06-08-2025"
          },
          {
            "item_name": "কচু শাক (Taro Stem)",
            "item_id": "LG008",
            "item_details": "Fibrous and earthy, needs proper cooking.",
            "item_quantity": "1 bundle",
            "item_weight": "300g",
            "item_price": "27 BDT",
            "item_image_path": "",
            "batch_date": "06-08-2025",
            "exp_date": "06-08-2025"
          },
          {
            "item_name": "মূলা শাক (Radish Leaves)",
            "item_id": "LG009",
            "item_details": "Sharp, peppery leaves, good for mash.",
            "item_quantity": "1 bundle",
            "item_weight": "200g",
            "item_price": "18 BDT",
            "item_image_path": "",
            "batch_date": "06-08-2025",
            "exp_date": "06-08-2025"
          },
          {
            "item_name": "লাউ শাক (Bottle Gourd Leaf)",
            "item_id": "LG010",
            "item_details": "Soft green leaves of bottle gourd.",
            "item_quantity": "1 bundle",
            "item_weight": "250g",
            "item_price": "20 BDT",
            "item_image_path": "",
            "batch_date": "06-08-2025",
            "exp_date": "06-08-2025"
          },
          {
            "item_name": "কুমড়ো শাক (Sweet Gourd Leaf)",
            "item_id": "LG011",
            "item_details": "Sweeter leaf, mild in taste, great with prawns.",
            "item_quantity": "1 bundle",
            "item_weight": "250g",
            "item_price": "23 BDT",
            "item_image_path": "",
            "batch_date": "06-08-2025",
            "exp_date": "06-08-2025"
          },
          {
            "item_name": "গিমা শাক (Kangkong)",
            "item_id": "LG012",
            "item_details": "Highly nutritious aquatic vegetable.",
            "item_quantity": "1 bundle",
            "item_weight": "300g",
            "item_price": "29 BDT",
            "item_image_path": "",
            "batch_date": "06-08-2025",
            "exp_date": "06-08-2025"
          },
          {
            "item_name": "ডাটা শাক (Stem Amaranth)",
            "item_id": "LG013",
            "item_details": "Thick, crunchy stems and leafy top.",
            "item_quantity": "1 bundle",
            "item_weight": "250g",
            "item_price": "21 BDT",
            "item_image_path": "",
            "batch_date": "06-08-2025",
            "exp_date": "06-08-2025"
          }
        ]
      },
      {
        "sub_category": "Root Vegetables",
        "item_list": []
      },
      {
        "sub_category": "Fruit Vegetables (ফলজাতীয় শাকসবজি)",
        "item_list": [
          {
            "item_name": "বেগুন (Eggplant)",
            "item_id": "FV001",
            "item_details": "Versatile vegetable for frying, grilling, or curries.",
            "item_quantity": "500g",
            "item_weight": "500g",
            "item_price": "28 BDT",
            "batch_date": "06-08-2025",
            "exp_date": "06-08-2025"
          },
          {
            "item_name": "ঢেঁড়শ (Ladyfinger)",
            "item_id": "FV002",
            "item_details": "Slim green pods, slightly sticky when cooked.",
            "item_quantity": "500g",
            "item_weight": "500g",
            "item_price": "30 BDT",
            "batch_date": "06-08-2025",
            "exp_date": "06-08-2025"
          },
          {
            "item_name": "লাউ (Bottle Gourd)",
            "item_id": "FV003",
            "item_details": "Light green gourd, ideal for broth-based dishes.",
            "item_quantity": "1 piece",
            "item_weight": "700g",
            "item_price": "35 BDT",
            "batch_date": "06-08-2025",
            "exp_date": "06-08-2025"
          }
        ]
      },
      {
        "sub_category": "Pods & Beans",
        "item_list": [
          {
            "item_name": "বরবটি (Yardlong Bean)",
            "item_id": "PB001",
            "item_details": "Long green pods, crunchy and fibrous.",
            "item_quantity": "500g",
            "item_weight": "500g",
            "item_price": "32 BDT",
            "batch_date": "06-08-2025",
            "exp_date": "06-08-2025"
          },
          {
            "item_name": "শিম (Hyacinth Bean)",
            "item_id": "PB002",
            "item_details": "Flat green pods, slightly sweet taste.",
            "item_quantity": "500g",
            "item_weight": "500g",
            "item_price": "30 BDT",
            "batch_date": "06-08-2025",
            "exp_date": "06-08-2025"
          },
          {
            "item_name": "মটর (Green Peas)",
            "item_id": "PB003",
            "item_details": "Sweet green peas, great in curries or snacks.",
            "item_quantity": "250g",
            "item_weight": "250g",
            "item_price": "20 BDT",
            "batch_date": "06-08-2025",
            "exp_date": "06-08-2025"
          }
        ]
      }
    ]
  },
  {
    "category": "Rice & Grains",
    "sub_category_list": [
      {
        "sub_category": "Rice Varieties",
        "item_list": []
      },
      {
        "sub_category": "Lentils",
        "item_list": []
      },
      {
        "sub_category": "Other Grains",
        "item_list": [
          {
            "item_name": "ভুট্টা (Corn on the Cob)",
            "item_id": "SV001",
            "item_details": "Fresh sweet corn, great for roasting or boiling.",
            "item_quantity": "2 pcs",
            "item_weight": "500g",
            "item_price": "35 BDT",
            "batch_date": "2025-05-24T12:17:44.793527",
            "exp_date": "2025-05-26T12:17:44.793527"
          }
        ]
      }
    ]
  },
  {
    "category": "Meat & Poultry",
    "sub_category_list": [
      {
        "sub_category": "Red Meat",
        "item_list": [
          {
            "item_name": "গরুর মাংস (হাড্ডিসহ) - Beef (Bone-in)",
            "item_id": "RM001",
            "item_details": "Fresh bone-in beef, ideal for flavorful curries and stews.",
            "item_quantity": "1 portion",
            "item_weight": "1 kg",
            "item_price": "650 BDT",
            "variant": "Local Farm",
            "origin": "Bangladesh",
            "image_name": "assets/images/beef-front-leg-bone.png",
            "batch_date": "2025-05-21T00:00:00.000Z",
            "exp_date": "2025-05-23T00:00:00.000Z"
          },
          {
            "item_name": "গরুর মাংস (হাড়বিহীন) - Beef (Boneless)",
            "item_id": "RM002",
            "item_details": "Premium boneless beef cuts, perfect for steaks and kebabs.",
            "item_quantity": "1 portion",
            "item_weight": "1 kg",
            "item_price": "720 BDT",
            "variant": "Grass-fed",
            "origin": "Bangladesh",
            "image_name": "assets/images/beef-boneless.webp",
            "batch_date": "2025-05-21T00:00:00.000Z",
            "exp_date": "2025-05-23T00:00:00.000Z"
          }
        ]
      },
      {
        "sub_category": "Poultry",
        "item_list": [
         
        ]
      },
      {
        "sub_category": "Others",
        "item_list": [
          
        ]
      }
    ]
  },
  {
    "category": "Fish & Seafood",
    "sub_category_list": [
      {
        "sub_category": "Freshwater Fish",
        "item_list": [
          {
            "item_name": "রুই মাছ (Rui Fish)",
            "item_id": "FWF001",
            "item_details": "Popular freshwater fish with soft texture, great for curries.",
            "item_quantity": "1 portion",
            "item_weight": "1 kg",
            "item_price": "380 BDT",
            "variant": "Farm Raised",
            "origin": "Bangladesh",
            "image_name": "assets/images/rui-fish.png",
            "batch_date": "2025-05-21T00:00:00.000Z",
            "exp_date": "2025-05-23T00:00:00.000Z"
          },
          {
            "item_name": "কাতলা মাছ (Katla Fish)",
            "item_id": "FWF002",
            "item_details": "Big head fish with juicy flesh, perfect for traditional dishes.",
            "item_quantity": "1 portion",
            "item_weight": "1 kg",
            "item_price": "400 BDT",
            "variant": "Farm Raised",
            "origin": "Bangladesh",
            "image_name": "assets/images/katla-fish.png",
            "batch_date": "2025-05-21T00:00:00.000Z",
            "exp_date": "2025-05-23T00:00:00.000Z"
          },
          {
            "item_name": "পাঙ্গাস মাছ (Pangas Fish)",
            "item_id": "FWF003",
            "item_details": "Soft textured fish, easy to cook and affordable.",
            "item_quantity": "1 portion",
            "item_weight": "1 kg",
            "item_price": "240 BDT",
            "variant": "Farm Raised",
            "origin": "Bangladesh",
            "image_name": "assets/images/pangas-fish.png",
            "batch_date": "2025-05-21T00:00:00.000Z",
            "exp_date": "2025-05-23T00:00:00.000Z"
          },
          {
            "item_name": "তেলাপিয়া মাছ (Tilapia Fish)",
            "item_id": "FWF004",
            "item_details": "Low-fat fish, popular in grilled and fried dishes.",
            "item_quantity": "1 portion",
            "item_weight": "1 kg",
            "item_price": "260 BDT",
            "variant": "Farm Raised",
            "origin": "Bangladesh",
            "image_name": "assets/images/tilapia-fish.png",
            "batch_date": "2025-05-21T00:00:00.000Z",
            "exp_date": "2025-05-23T00:00:00.000Z"
          },
          {
            "item_name": "কই মাছ (Koi Fish)",
            "item_id": "FWF005",
            "item_details": "Traditional deshi fish, rich in taste and texture.",
            "item_quantity": "1 portion",
            "item_weight": "500g",
            "item_price": "300 BDT",
            "variant": "Deshi",
            "origin": "Bangladesh",
            "image_name": "assets/images/koi-fish.png",
            "batch_date": "2025-05-21T00:00:00.000Z",
            "exp_date": "2025-05-23T00:00:00.000Z"
          },
          {
            "item_name": "মাগুর মাছ (Magur Fish)",
            "item_id": "FWF006",
            "item_details": "Nutritious and medicinal value, great for recovery diets.",
            "item_quantity": "1 portion",
            "item_weight": "500g",
            "item_price": "480 BDT",
            "variant": "Wild",
            "origin": "Bangladesh",
            "image_name": "assets/images/magur-fish.png",
            "batch_date": "2025-05-21T00:00:00.000Z",
            "exp_date": "2025-05-23T00:00:00.000Z"
          },
          {
            "item_name": "শিং মাছ (Shing Fish)",
            "item_id": "FWF007",
            "item_details": "Slippery skinned fish, rich in protein and taste.",
            "item_quantity": "1 portion",
            "item_weight": "500g",
            "item_price": "450 BDT",
            "variant": "Wild",
            "origin": "Bangladesh",
            "image_name": "assets/images/shing-fish.png",
            "batch_date": "2025-05-21T00:00:00.000Z",
            "exp_date": "2025-05-23T00:00:00.000Z"
          },
          {
            "item_name": "পাবদা মাছ (Pabda Fish)",
            "item_id": "FWF008",
            "item_details": "Soft boned, delicate fish best served in mustard curry.",
            "item_quantity": "1 portion",
            "item_weight": "500g",
            "item_price": "420 BDT",
            "variant": "Deshi",
            "origin": "Bangladesh",
            "image_name": "assets/images/pabda-fish.png",
            "batch_date": "2025-05-21T00:00:00.000Z",
            "exp_date": "2025-05-23T00:00:00.000Z"
          },
          {
            "item_name": "টেংরা মাছ (Tengra Fish)",
            "item_id": "FWF009",
            "item_details": "Small river fish, ideal for spicy curry lovers.",
            "item_quantity": "1 portion",
            "item_weight": "500g",
            "item_price": "400 BDT",
            "variant": "River Catch",
            "origin": "Bangladesh",
            "image_name": "assets/images/tengra-fish.png",
            "batch_date": "2025-05-21T00:00:00.000Z",
            "exp_date": "2025-05-23T00:00:00.000Z"
          }
        ]
      },
      {
        "sub_category": "Hilsha",
        "item_list": []
      },
      {
        "sub_category": "Saltwater Fish",
        "item_list": []
      },
      {
        "sub_category": "Shrimp/Prawn",
        "item_list": []
      }
    ]
  },
  {
    "category": "Spices & Condiments",
    "sub_category_list": [
      {
        "sub_category": "Whole Spices",
        "item_list": []
      },
      {
        "sub_category": "Powdered Spices",
        "item_list": []
      },
      {
        "sub_category": "Fresh Condiments",
        "item_list": []
      }
    ]
  },
  {
    "category": "Oil & Ghee",
    "sub_category_list": [
      {
        "sub_category": "Cooking Oils",
        "item_list": []
      },
      {
        "sub_category": "Ghee",
        "item_list": []
      }
    ]
  },
  {
    "category": "Flour & Baking Essentials",
    "sub_category_list": [
      {
        "sub_category": "Wheat Flour Types",
        "item_list": []
      },
      {
        "sub_category": "Rice Flour & Others",
        "item_list": []
      },
      {
        "sub_category": "Baking Ingredients",
        "item_list": []
      }
    ]
  },
  {
    "category": "Snacks & Sweets Ingredients",
    "sub_category_list": [
      {
        "sub_category": "Dry Snacks",
        "item_list": []
      },
      {
        "sub_category": "Traditional Sweet Ingredients",
        "item_list": []
      }
    ]
  },
  {
    "category": "Fruits",
    "sub_category_list": [
      {
        "sub_category": "Summer Fruits",
        "item_list": []
      },
      {
        "sub_category": "Winter Fruits",
        "item_list": []
      },
      {
        "sub_category": "All-season Fruits",
        "item_list": []
      }
    ]
  },
  {
    "category": "Dairy",
    "sub_category_list": [
      {
        "sub_category": "Milk & Powdered Milk",
        "item_list": []
      },
      {
        "sub_category": "Yogurt & Paneer",
        "item_list": []
      },
      {
        "sub_category": "Butter & Cheese",
        "item_list": []
      }
    ]
  },
  {
    "category": "Packaged Foods",
    "sub_category_list": [
      {
        "sub_category": "Biscuits & Snacks",
        "item_list": []
      },
      {
        "sub_category": "Instant item_list",
        "item_list": []
      },
      {
        "sub_category": "Pickles & Jams",
        "item_list": []
      }
    ]
  },
  {
    "category": "Beverages",
    "sub_category_list": [
      {
        "sub_category": "Tea & Coffee",
        "item_list": []
      },
      {
        "sub_category": "Soft Drinks",
        "item_list": []
      },
      {
        "sub_category": "Water & Juices",
        "item_list": []
      }
    ]
  },
  {
    "category": "Household Essentials",
    "sub_category_list": [
      {
        "sub_category": "Cleaning Products",
        "item_list": []
      },
      {
        "sub_category": "Personal Care",
        "item_list": []
      },
      {
        "sub_category": "Miscellaneous",
        "item_list": []
      }
    ]
  }
]
''';

  static const othersFeeds = '''
    {
    "user_id":"",
    "user_name":"",
    "submitted_price":"",
    "upvoted_count":"",
    "donwnvoted_count":"",
    "net_weight":"",
    "quantity":"",
    "exp_date":"",
    "batch_date":"",
    "uploaded_at":"",
    "area_name":"",
    "area_id":"",
    "market_name":"",
    "market_id":"",
    "district_name:""
    }

''';
}



//   {"sub_category": "Root Vegetables", "items": ["Aloo", "Misti Aloo", "Mula"]},
//       {"sub_category": "Fruit Vegetables", "items": ["Begun", "Dherosh", "Lau", "Jhinga", "Kumra", "Mistikumra", "Patal", "Karola", "Tomato"]},
//       {"sub_category": "Pods & Beans", "items": ["Barboti", "Sheem", "Motor"]}
//     ]
//   },
//   {
//     "category": "Rice & Grains",
//     "sub_category_list": [
//       {"sub_category": "Rice Varieties", "items": ["Atap Chal", "Chinigura", "Bashmoti", "Parboiled Rice", "Kalijira"]},
//       {"sub_category": "Lentils", "items": ["Mung Dal", "Mashur Dal", "Cholar Dal", "Khesari Dal"]},
//       {"sub_category": "Other Grains", "items": ["Bhutta"]}
//     ]
//   },
//   {
//     "category": "Meat & Poultry",
//     "sub_category_list": [
//       {"sub_category": "Red Meat", "items": ["Beef", "Mutton"]},
//       {"sub_category": "Poultry", "items": ["Chicken (Deshi)", "Chicken (Broiler)", "Duck"]},
//       {"sub_category": "Others", "items": ["Quail"]}
//     ]
//   },
//   {
//     "category": "Fish & Seafood",
//     "sub_category_list": [
//       {"sub_category": "Freshwater Fish", "items": ["Rui", "Katla", "Pangas", "Tilapia", "Koi", "Magur", "Shing", "Pabda", "Tengra"]},
//       {"sub_category": "Hilsha", "items": ["Ilish (various sizes)"]},
//       {"sub_category": "Saltwater Fish", "items": ["Loitta", "Rupchanda"]},
//       {"sub_category": "Shrimp/Prawn", "items": ["Bagda Chingri", "Golda Chingri"]}
//     ]
//   },
//   {
//     "category": "Spices & Condiments",
//     "sub_category_list": [
//       {"sub_category": "Whole Spices", "items": ["Jeera", "Darchini", "Elach", "Lobongo", "Methi", "Mustard Seed"]},
//       {"sub_category": "Powdered Spices", "items": ["Morich", "Holud", "Dhone", "Panchforon"]},
//       {"sub_category": "Fresh Condiments", "items": ["Onion", "Garlic", "Ginger", "Tamarind"]}
//     ]
//   },
//   {
//     "category": "Oil & Ghee",
//     "sub_category_list": [
//       {"sub_category": "Cooking Oils", "items": ["Soybean Oil", "Mustard Oil", "Palm Oil"]},
//       {"sub_category": "Ghee", "items": ["Cow Ghee", "Buffalo Ghee"]}
//     ]
//   },
//   {
//     "category": "Flour & Baking Essentials",
//     "sub_category_list": [
//       {"sub_category": "Wheat Flour Types", "items": ["Atta", "Maida"]},
//       {"sub_category": "Rice Flour & Others", "items": ["Suji", "Rice Flour", "Corn Flour"]},
//       {"sub_category": "Baking Ingredients", "items": ["Baking Powder", "Yeast"]}
//     ]
//   },
//   {
//     "category": "Snacks & Sweets Ingredients",
//     "sub_category_list": [
//       {"sub_category": "Dry Snacks", "items": ["Chira", "Muri", "Khoi"]},
//       {"sub_category": "Traditional Sweet Ingredients", "items": ["Gur", "Sugar", "Coconut", "Semai", "Vermicelli"]}
//     ]
//   },
//   {
//     "category": "Fruits",
//     "sub_category_list": [
//       {"sub_category": "Summer Fruits", "items": ["Mango", "Litchi", "Watermelon", "Pineapple"]},
//       {"sub_category": "Winter Fruits", "items": ["Guava", "Orange", "Jambura"]},
//       {"sub_category": "All-season Fruits", "items": ["Banana", "Papaya", "Apple (imported)"]}
//     ]
//   },
//   {
//     "category": "Dairy",
//     "sub_category_list": [
//       {"sub_category": "Milk & Powdered Milk", "items": ["Liquid Milk", "Powdered Milk"]},
//       {"sub_category": "Yogurt & Paneer", "items": ["Sweet Yogurt", "Sour Yogurt", "Paneer"]},
//       {"sub_category": "Butter & Cheese", "items": ["Butter", "Processed Cheese"]}
//     ]
//   },
//   {
//     "category": "Packaged Foods",
//     "sub_category_list": [
//       {"sub_category": "Biscuits & Snacks", "items": ["Biscuits", "Chanachur"]},
//       {"sub_category": "Instant Items", "items": ["Instant Noodles", "Cup Noodles"]},
//       {"sub_category": "Pickles & Jams", "items": ["Pickle (Aachar)", "Jam", "Honey"]}
//     ]
//   },
//   {
//     "category": "Beverages",
//     "sub_category_list": [
//       {"sub_category": "Tea & Coffee", "items": ["Tea Leaf", "Instant Coffee"]},
//       {"sub_category": "Soft Drinks", "items": ["Cola", "Lemon Soda"]},
//       {"sub_category": "Water & Juices", "items": ["Mineral Water", "Fruit Juice"]}
//     ]
//   },
//   {
//     "category": "Household Essentials",
//     "sub_category_list": [
//       {"sub_category": "Cleaning Products", "items": ["Dishwashing Liquid", "Detergent", "Toilet Cleaner"]},
//       {"sub_category": "Personal Care", "items": ["Soap", "Toothpaste", "Shampoo"]},
//       {"sub_category": "Miscellaneous", "items": ["Matches", "Mosquito Coil"]}
//     ]
//   }
// ]


