import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);

const double defaultPadding = 16.0;

List meatList = [
  {
    "id": "0",
    "price": "650 BDT",
    "name": "Beef (Bone-in)",
    "quantity": "1 kg",
    "imageName": "assets/images/beef-front-leg-bone.png",
    "details": "Fresh bone-in beef, ideal for flavorful curries and stews.",
    "variant": "Local Farm",
    "net-weight": "1 kg",
    "origin": "Bangladesh"
  },
  {
    "id": "1",
    "price": "720 BDT",
    "name": "Beef (Boneless)",
    "quantity": "1 kg",
    "imageName": "assets/images/beef-boneless.webp",
    "details": "Premium boneless beef cuts, perfect for steaks and kebabs.",
    "variant": "Grass-fed",
    "net-weight": "1 kg",
    "origin": "Bangladesh"
  },
  // {
  //   "id": "2",
  //   "price": "1150 BDT",
  //   "name": "Mutton (Bone-in)",
  //   "quantity": "1 kg",
  //   "imageName": "assets/images/mutton-bone-in-khashi.webp",
  //   "details": "Tender bone-in mutton, sourced fresh for traditional dishes.",
  //   "variant": "Black Bengal Goat",
  //   "net-weight": "1 kg",
  //   "origin": "Rural Farm"
  // },
  // {
  //   "id": "3",
  //   "price": "1250 BDT",
  //   "name": "Mutton (Boneless)",
  //   "quantity": "1 kg",
  //   "imageName": "assets/images/mutton-boneless.webp",
  //   "details": "Lean and juicy boneless mutton, great for biryani or curry.",
  //   "variant": "Farm-raised",
  //   "net-weight": "1 kg",
  //   "origin": "Rangpur, BD"
  // },
  // {
  //   "id": "4",
  //   "price": "950 BDT",
  //   "name": "Lamb Chops",
  //   "quantity": "1 kg",
  //   "imageName": "assets/images/raw_lamp_chops.png",
  //   "details": "Premium lamb chops with fat marbling — tender and flavorful.",
  //   "variant": "Imported",
  //   "net-weight": "1 kg",
  //   "origin": "New Zealand"
  // }
];

const dummyData = ''' 
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
        "item_list": [
          {
          "item_name": "আলু (Potato)",
          "item_id": "RV001",
          "item_details": "Staple root vegetable, great for curries and fries.",
          "item_quantity": "1kg",
          "item_weight": "1kg",
          "item_price": "30 BDT",
            "item_image_path": "",

          "batch_date": "2025-05-24T12:17:44.793527",
          "exp_date": "2025-05-26T12:17:44.793527"
        },
        {
          "item_name": "মিষ্টি আলু (Sweet Potato)",
          "item_id": "RV002",
          "item_details": "Sweet and starchy root, good for roasting.",
          "item_quantity": "1kg",
          "item_weight": "1kg",
          "item_price": "40 BDT",
          "item_image_path": "",
          "batch_date": "2025-05-24T12:17:44.793527",
          "exp_date": "2025-05-26T12:17:44.793527"
        },
        {
          "item_name": "মূলা (Radish)",
          "item_id": "RV003",
          "item_details": "White long root, crisp and peppery taste.",
          "item_quantity": "1kg",
          "item_weight": "1kg",
          "item_price": "35 BDT",
          "item_image_path": "",
          "batch_date": "2025-05-24T12:17:44.793527",
          "exp_date": "2025-05-26T12:17:44.793527"
        }]
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
            "item_image_path": "",
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
            "item_image_path": "",
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
            "item_image_path": "",
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
            "item_image_path": "",
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
            "item_image_path": "",
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
            "item_image_path": "",
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
  "item_list": [
    {
      "item_name": "বাসমতি চাল (Basmati Rice)",
      "item_id": "RV001",
      "item_details": "Long-grain aromatic rice, ideal for biryani and pulao.",
      "item_quantity": "1kg",
      "item_weight": "1kg",
      "item_price": "120 BDT",
      "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-08-2026"
    },
    {
      "item_name": "আতপ চাল (Atap Rice)",
      "item_id": "RV002",
      "item_details": "Parboiled rice, soft texture when cooked.",
      "item_quantity": "1kg",
      "item_weight": "1kg",
      "item_price": "65 BDT",
      "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-08-2026"
    },
    {
      "item_name": "কালোজিরা চাল (Kalijira Rice)",
      "item_id": "RV003",
      "item_details": "Tiny aromatic rice, perfect for special dishes.",
      "item_quantity": "500g",
      "item_weight": "500g",
      "item_price": "80 BDT",
      "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-08-2026"
    }
  ]
},
{
  "sub_category": "Lentils",
  "item_list": [
    {
      "item_name": "মসুর ডাল (Masoor Dal)",
      "item_id": "L001",
      "item_details": "Red lentils, cooks quickly, high in protein.",
      "item_quantity": "500g",
      "item_weight": "500g",
      "item_price": "55 BDT",
      "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-08-2026"
    },
    {
      "item_name": "মুগ ডাল (Moong Dal)",
      "item_id": "L002",
      "item_details": "Yellow split lentils, easy to digest and nutritious.",
      "item_quantity": "500g",
      "item_weight": "500g",
      "item_price": "60 BDT",
      "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-08-2026"
    },
    {
      "item_name": "চানা ডাল (Chana Dal)",
      "item_id": "L003",
      "item_details": "Split chickpeas, rich in fiber and flavor.",
      "item_quantity": "500g",
      "item_weight": "500g",
      "item_price": "50 BDT",
      "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-08-2026"
    }
  ]
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
            "item_image_path": "",
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
            "item_image_path": "assets/images/beef-front-leg-bone.png",
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
            "item_image_path": "assets/images/beef-boneless.webp",
            "batch_date": "2025-05-21T00:00:00.000Z",
            "exp_date": "2025-05-23T00:00:00.000Z"
          }
        ]
      },
      {
  "sub_category": "Poultry",
  "item_list": [
    {
      "item_name": "দেশি মুরগি (Deshi Chicken)",
      "item_id": "P001",
      "item_details": "Free-range chicken, known for its rich flavor and lean meat.",
      "item_quantity": "1kg",
      "item_weight": "1kg",
      "item_price": "380 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "08-08-2025"
    },
    {
      "item_name": "ব্রয়লার মুরগি (Broiler Chicken)",
      "item_id": "P002",
      "item_details": "Soft and tender meat, commonly used in daily meals.",
      "item_quantity": "1kg",
      "item_weight": "1kg",
      "item_price": "220 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "08-08-2025"
    },
    {
      "item_name": "হাঁস (Duck)",
      "item_id": "P003",
      "item_details": "Rich and flavorful meat, ideal for traditional curries.",
      "item_quantity": "1kg",
      "item_weight": "1kg",
      "item_price": "400 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "08-08-2025"
    },
    {
      "item_name": "ডিম (Eggs - Chicken)",
      "item_id": "P004",
      "item_details": "Farm-fresh eggs, high in protein.",
      "item_quantity": "12 pcs",
      "item_weight": "700g",
      "item_price": "120 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "13-08-2025"
    }
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
            "item_image_path": "assets/images/rui-fish.png",
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
            "item_image_path": "assets/images/katla-fish.png",
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
            "item_image_path": "assets/images/pangas-fish.png",
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
            "item_image_path": "assets/images/tilapia-fish.png",
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
            "item_image_path": "assets/images/koi-fish.png",
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
            "item_image_path": "assets/images/magur-fish.png",
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
            "item_image_path": "assets/images/shing-fish.png",
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
            "item_image_path": "assets/images/pabda-fish.png",
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
            "item_image_path": "assets/images/tengra-fish.png",
            "batch_date": "2025-05-21T00:00:00.000Z",
            "exp_date": "2025-05-23T00:00:00.000Z"
          }
        ]
      },
     {
  "sub_category": "Hilsha",
  "item_list": [
    {
      "item_name": "ইলিশ মাছ (Hilsha Fish - Medium)",
      "item_id": "H001",
      "item_details": "Fresh Padma river Hilsha, medium size, rich in flavor and fat.",
      "item_quantity": "1 piece (~800g)",
      "item_weight": "800g",
      "item_price": "900 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "08-08-2025"
    },
    {
      "item_name": "ইলিশ মাছ (Hilsha Fish - Large)",
      "item_id": "H002",
      "item_details": "Premium large-size Hilsha, ideal for special dishes.",
      "item_quantity": "1 piece (~1.2kg)",
      "item_weight": "1.2kg",
      "item_price": "1450 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "08-08-2025"
    }
  ]
},
      {
  "sub_category": "Saltwater Fish",
  "item_list": [
    {
      "item_name": "রূপচাঁদা (Pomfret)",
      "item_id": "SF001",
      "item_details": "White pomfret, firm texture and mild taste.",
      "item_quantity": "1kg",
      "item_weight": "1kg",
      "item_price": "750 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "08-08-2025"
    },
    {
      "item_name": "লইট্টা মাছ (Bombay Duck)",
      "item_id": "SF002",
      "item_details": "Soft, salty fish often dried or fried.",
      "item_quantity": "500g",
      "item_weight": "500g",
      "item_price": "180 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "08-08-2025"
    },
    {
      "item_name": "ভেটকি (Sea Bass)",
      "item_id": "SF003",
      "item_details": "Lean white fish, excellent for grilling or curries.",
      "item_quantity": "1kg",
      "item_weight": "1kg",
      "item_price": "620 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "08-08-2025"
    }
  ]
},
      {
  "sub_category": "Shrimp/Prawn",
  "item_list": [
    {
      "item_name": "গলদা চিংড়ি (Giant River Prawn)",
      "item_id": "SP001",
      "item_details": "Large freshwater prawns, great for curry dishes.",
      "item_quantity": "500g",
      "item_weight": "500g",
      "item_price": "480 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "08-08-2025"
    },
    {
      "item_name": "ছোট চিংড়ি (Small Shrimp)",
      "item_id": "SP002",
      "item_details": "Deveined small shrimp, ideal for fries or stir-fries.",
      "item_quantity": "500g",
      "item_weight": "500g",
      "item_price": "220 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "08-08-2025"
    },
    {
      "item_name": "চিংড়ি (Tiger Prawn)",
      "item_id": "SP003",
      "item_details": "Firm and juicy tiger prawns, perfect for grills.",
      "item_quantity": "1kg",
      "item_weight": "1kg",
      "item_price": "850 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "08-08-2025"
    }
  ]
}
    ]
  },
  {
    "category": "Spices & Condiments",
    "sub_category_list": [
   
{
  "sub_category": "Whole Spices",
  "item_list": [
    {
      "item_name": "দারুচিনি (Cinnamon Sticks)",
      "item_id": "WS001",
      "item_details": "Aromatic bark used in curries and desserts.",
      "item_quantity": "100g",
      "item_weight": "100g",
      "item_price": "45 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-08-2026"
    },
    {
      "item_name": "এলাচ (Green Cardamom)",
      "item_id": "WS002",
      "item_details": "Fragrant spice pods used in both sweet and savory dishes.",
      "item_quantity": "50g",
      "item_weight": "50g",
      "item_price": "90 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-08-2026"
    },
    {
      "item_name": "লবঙ্গ (Cloves)",
      "item_id": "WS003",
      "item_details": "Strongly aromatic whole spice used in biryani and curries.",
      "item_quantity": "50g",
      "item_weight": "50g",
      "item_price": "60 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-08-2026"
    },
    {
      "item_name": "জিরা (Cumin Seeds)",
      "item_id": "WS004",
      "item_details": "Earthy flavored seeds essential for tempering and curries.",
      "item_quantity": "100g",
      "item_weight": "100g",
      "item_price": "35 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-08-2026"
    },
    {
      "item_name": "মেথি (Fenugreek Seeds)",
      "item_id": "WS005",
      "item_details": "Bitter aromatic seeds used in pickles and spice blends.",
      "item_quantity": "100g",
      "item_weight": "100g",
      "item_price": "25 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-08-2026"
    }
  ]
},
      {
  "sub_category": "Powdered Spices",
  "item_list": [
    {
      "item_name": "হলুদ গুঁড়া (Turmeric Powder)",
      "item_id": "PS001",
      "item_details": "Bright yellow spice with anti-inflammatory properties, used in almost all curries.",
      "item_quantity": "100g",
      "item_weight": "100g",
      "item_price": "25 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-08-2026"
    },
    {
      "item_name": "মরিচ গুঁড়া (Red Chili Powder)",
      "item_id": "PS002",
      "item_details": "Hot and vibrant red powder to spice up dishes.",
      "item_quantity": "100g",
      "item_weight": "100g",
      "item_price": "30 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-08-2026"
    },
    {
      "item_name": "ধনে গুঁড়া (Coriander Powder)",
      "item_id": "PS003",
      "item_details": "Mild, earthy spice powder often used in meat and vegetable curries.",
      "item_quantity": "100g",
      "item_weight": "100g",
      "item_price": "28 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-08-2026"
    },
    {
      "item_name": "জিরা গুঁড়া (Cumin Powder)",
      "item_id": "PS004",
      "item_details": "Ground cumin with warm, nutty flavor, great for seasoning.",
      "item_quantity": "100g",
      "item_weight": "100g",
      "item_price": "35 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-08-2026"
    },
    {
      "item_name": "গরম মসলা গুঁড়া (Garam Masala Powder)",
      "item_id": "PS005",
      "item_details": "Aromatic blend of spices used for rich flavor in finishing dishes.",
      "item_quantity": "50g",
      "item_weight": "50g",
      "item_price": "40 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-08-2026"
    }
  ]
}
,
      {
  "sub_category": "Fresh Condiments",
  "item_list": [
    {
      "item_name": "রসুন (Garlic - Fresh)",
      "item_id": "FC001",
      "item_details": "Fresh aromatic garlic bulbs, essential for flavoring and health benefits.",
      "item_quantity": "500g",
      "item_weight": "500g",
      "item_price": "80 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "13-08-2025"
    },
    {
      "item_name": "আদা (Ginger - Fresh)",
      "item_id": "FC002",
      "item_details": "Zesty and spicy root used in curries and teas.",
      "item_quantity": "500g",
      "item_weight": "500g",
      "item_price": "70 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "13-08-2025"
    },
    {
      "item_name": "কাঁচা মরিচ (Green Chili)",
      "item_id": "FC003",
      "item_details": "Fresh green chilies, adds heat and flavor to any dish.",
      "item_quantity": "250g",
      "item_weight": "250g",
      "item_price": "25 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "10-08-2025"
    },
    {
      "item_name": "পেঁয়াজ (Onion - Red)",
      "item_id": "FC004",
      "item_details": "Sharp and flavorful red onions, essential for cooking.",
      "item_quantity": "1kg",
      "item_weight": "1kg",
      "item_price": "45 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "13-08-2025"
    },
    {
      "item_name": "লেবু (Lime - Local)",
      "item_id": "FC005",
      "item_details": "Juicy local limes, great for garnishing and marinades.",
      "item_quantity": "4 pcs",
      "item_weight": "200g",
      "item_price": "20 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "09-08-2025"
    }
  ]
}

    ]
  },
  {
    "category": "Oil & Ghee",
    "sub_category_list": [
     {
  "sub_category": "Cooking Oils",
  "item_list": [
    {
      "item_name": "সরিষার তেল (Mustard Oil)",
      "item_id": "CO001",
      "item_details": "Aromatic mustard oil ideal for traditional Bengali cooking.",
      "item_quantity": "500ml",
      "item_weight": "460g",
      "item_price": "110 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-02-2026"
    },
    {
      "item_name": "সয়াবিন তেল (Soybean Oil)",
      "item_id": "CO002",
      "item_details": "Refined soybean oil, suitable for daily cooking and frying.",
      "item_quantity": "1 liter",
      "item_weight": "920g",
      "item_price": "165 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-02-2026"
    },
    {
      "item_name": "সানফ্লাওয়ার তেল (Sunflower Oil)",
      "item_id": "CO003",
      "item_details": "Light and healthy sunflower oil with a mild flavor.",
      "item_quantity": "1 liter",
      "item_weight": "910g",
      "item_price": "180 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-02-2026"
    },
    {
      "item_name": "নারকেল তেল (Coconut Oil)",
      "item_id": "CO004",
      "item_details": "Cold-pressed coconut oil, suitable for cooking and hair care.",
      "item_quantity": "250ml",
      "item_weight": "230g",
      "item_price": "120 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-08-2026"
    }
  ]
}
,
      {
  "sub_category": "Ghee",
  "item_list": [
    {
      "item_name": "দুধের ঘি (Pure Milk Ghee)",
      "item_id": "GH001",
      "item_details": "Rich and aromatic clarified butter made from fresh cow’s milk.",
      "item_quantity": "250g",
      "item_weight": "250g",
      "item_price": "350 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-08-2026"
    },
    {
      "item_name": "দুধের ঘি (Pure Milk Ghee)",
      "item_id": "GH002",
      "item_details": "Premium quality ghee with traditional taste and aroma.",
      "item_quantity": "500g",
      "item_weight": "500g",
      "item_price": "650 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-08-2026"
    },
    {
      "item_name": "দুধের ঘি (Pure Milk Ghee)",
      "item_id": "GH003",
      "item_details": "Economical 1kg pack for daily use in cooking and baking.",
      "item_quantity": "1kg",
      "item_weight": "1kg",
      "item_price": "1250 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-08-2026"
    }
  ]
}

    ]
  },
  {
    "category": "Flour & Baking Essentials",
    "sub_category_list": [
      {
  "sub_category": "Wheat Flour Types",
  "item_list": [
    {
      "item_name": "সাদা ময়দা (Refined Wheat Flour)",
      "item_id": "WF001",
      "item_details": "Fine white wheat flour used for baking and making sweets.",
      "item_quantity": "1kg",
      "item_weight": "1kg",
      "item_price": "60 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-02-2026"
    },
    {
      "item_name": "আটা (Whole Wheat Flour)",
      "item_id": "WF002",
      "item_details": "Whole wheat flour ideal for making roti and paratha.",
      "item_quantity": "1kg",
      "item_weight": "1kg",
      "item_price": "55 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-02-2026"
    },
    {
      "item_name": "ময়দা (Cake Flour)",
      "item_id": "WF003",
      "item_details": "Fine-textured flour best for cakes and pastries.",
      "item_quantity": "500g",
      "item_weight": "500g",
      "item_price": "70 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-02-2026"
    },
    {
      "item_name": "ব্রেড ময়দা (Bread Flour)",
      "item_id": "WF004",
      "item_details": "High-protein flour specially for bread making.",
      "item_quantity": "1kg",
      "item_weight": "1kg",
      "item_price": "75 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-02-2026"
    }
  ]
}
,
     {
  "sub_category": "Rice Flour & Others",
  "item_list": [
    {
      "item_name": "চালের আটা (Rice Flour)",
      "item_id": "RF001",
      "item_details": "Fine rice flour used in traditional sweets and snacks.",
      "item_quantity": "500g",
      "item_weight": "500g",
      "item_price": "45 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-02-2026"
    },
    {
      "item_name": "বেসন (Gram Flour / Besan)",
      "item_id": "RF002",
      "item_details": "Ground chickpea flour, essential for fritters and sweets.",
      "item_quantity": "500g",
      "item_weight": "500g",
      "item_price": "50 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-02-2026"
    },
    {
      "item_name": "ময়দা (All-purpose Flour)",
      "item_id": "RF003",
      "item_details": "Versatile flour for general cooking and baking needs.",
      "item_quantity": "1kg",
      "item_weight": "1kg",
      "item_price": "60 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-02-2026"
    }
  ]
},
{
  "sub_category": "Baking Ingredients",
  "item_list": [
    {
      "item_name": "বেকিং পাউডার (Baking Powder)",
      "item_id": "BI001",
      "item_details": "Leavening agent to help baked goods rise.",
      "item_quantity": "100g",
      "item_weight": "100g",
      "item_price": "40 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-08-2026"
    },
    {
      "item_name": "বেকিং সোডা (Baking Soda)",
      "item_id": "BI002",
      "item_details": "Used as a leavening agent and for tenderizing.",
      "item_quantity": "100g",
      "item_weight": "100g",
      "item_price": "30 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-08-2026"
    },
    {
      "item_name": "ভ্যানিলা এসেন্স (Vanilla Essence)",
      "item_id": "BI003",
      "item_details": "Flavoring agent for cakes and desserts.",
      "item_quantity": "50ml",
      "item_weight": "50g",
      "item_price": "120 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-08-2026"
    },
    {
      "item_name": "চিনি (Powdered Sugar)",
      "item_id": "BI004",
      "item_details": "Finely ground sugar used for icing and baking.",
      "item_quantity": "500g",
      "item_weight": "500g",
      "item_price": "50 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-02-2026"
    }
  ]
}

    ]
  },
  {
    "category": "Snacks & Sweets Ingredients",
    "sub_category_list": [
     {
  "sub_category": "Dry Snacks",
  "item_list": [
    {
      "item_name": "চানাচুর (Chanachur)",
      "item_id": "DS001",
      "item_details": "Spicy and crunchy mixture of fried lentils, nuts, and spices.",
      "item_quantity": "200g",
      "item_weight": "200g",
      "item_price": "50 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-02-2026"
    },
    {
      "item_name": "মুড়ি (Puffed Rice)",
      "item_id": "DS002",
      "item_details": "Light and airy puffed rice used as a snack or in chaat.",
      "item_quantity": "250g",
      "item_weight": "250g",
      "item_price": "30 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-02-2026"
    },
    {
      "item_name": "মুড়কুট্টা (Murukku)",
      "item_id": "DS003",
      "item_details": "Crunchy savory snack made from rice flour and spices.",
      "item_quantity": "150g",
      "item_weight": "150g",
      "item_price": "60 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-02-2026"
    },
    {
      "item_name": "মিষ্টি চানা (Sweet Chickpeas)",
      "item_id": "DS004",
      "item_details": "Boiled and sweetened chickpeas, a traditional dry sweet snack.",
      "item_quantity": "200g",
      "item_weight": "200g",
      "item_price": "45 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-02-2026"
    }
  ]
}
,
      {
  "sub_category": "Traditional Sweet Ingredients",
  "item_list": [
    {
      "item_name": "চিনি (Sugar)",
      "item_id": "TSI001",
      "item_details": "Refined sugar used widely in traditional Bengali sweets.",
      "item_quantity": "1kg",
      "item_weight": "1000g",
      "item_price": "90 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-08-2027"
    },
    {
      "item_name": "খোয়া ক্ষীর (Khoa/Kheer)",
      "item_id": "TSI002",
      "item_details": "Condensed milk solid used as the base for many Bengali sweets like Sandesh and Kalojam.",
      "item_quantity": "500g",
      "item_weight": "500g",
      "item_price": "280 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-09-2025"
    },
    {
      "item_name": "ছানা (Chhena)",
      "item_id": "TSI003",
      "item_details": "Fresh curdled milk used to make sweets like Rasgulla and Sandesh.",
      "item_quantity": "500g",
      "item_weight": "500g",
      "item_price": "200 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "08-08-2025"
    },
    {
      "item_name": "সুজি (Semolina)",
      "item_id": "TSI004",
      "item_details": "Granulated wheat used in making halwa and other sweet treats.",
      "item_quantity": "500g",
      "item_weight": "500g",
      "item_price": "60 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-08-2026"
    },
    {
      "item_name": "গুড় (Date Palm Jaggery)",
      "item_id": "TSI005",
      "item_details": "Traditional date palm jaggery, essential for winter sweets like Pitha and Payesh.",
      "item_quantity": "1kg",
      "item_weight": "1000g",
      "item_price": "160 BDT",
        "item_image_path": "",
      "batch_date": "06-08-2025",
      "exp_date": "06-08-2026"
    }
  ]
}
    ]
  },
  {
    "category": "Fruits",
    "sub_category_list": [
       {
    "sub_category": "Summer Fruits",
    "item_list": [
      {
        "item_name": "লিচু (Litchi)",
        "item_id": "SF001",
        "item_details": "Juicy and sweet summer fruit popular across Bangladesh.",
        "item_quantity": "1 dozen",
        "item_weight": "800g",
        "item_price": "120 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "10-08-2025"
      },
      {
        "item_name": "আম (Mango)",
        "item_id": "SF002",
        "item_details": "The king of fruits in Bangladesh, especially varieties like Himsagar and Langra.",
        "item_quantity": "1kg",
        "item_weight": "1000g",
        "item_price": "100 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "13-08-2025"
      },
      {
        "item_name": "কাঁঠাল (Jackfruit)",
        "item_id": "SF003",
        "item_details": "National fruit of Bangladesh, large and sweet.",
        "item_quantity": "1 medium piece",
        "item_weight": "4kg",
        "item_price": "200 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "08-08-2025"
      },
      {
        "item_name": "তরমুজ (Watermelon)",
        "item_id": "SF004",
        "item_details": "Refreshing and hydrating fruit for the hot summer season.",
        "item_quantity": "1 medium piece",
        "item_weight": "3kg",
        "item_price": "180 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "09-08-2025"
      }
    ]
  },
  {
    "sub_category": "Winter Fruits",
    "item_list": [
      {
        "item_name": "কমলা (Orange)",
        "item_id": "WF001",
        "item_details": "Sweet and tangy winter fruit rich in vitamin C.",
        "item_quantity": "1kg",
        "item_weight": "1000g",
        "item_price": "140 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "12-08-2025"
      },
      {
        "item_name": "শিমুল ফল (Persimmon)",
        "item_id": "WF002",
        "item_details": "Mildly sweet and pulpy winter fruit available in local markets.",
        "item_quantity": "500g",
        "item_weight": "500g",
        "item_price": "90 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "10-08-2025"
      },
      {
        "item_name": "আপেল (Apple)",
        "item_id": "WF003",
        "item_details": "Commonly imported but widely available in winter across Bangladesh.",
        "item_quantity": "1kg",
        "item_weight": "1000g",
        "item_price": "200 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "14-08-2025"
      },
      {
        "item_name": "বড়ই (Jujube/Boroi)",
        "item_id": "WF004",
        "item_details": "Crunchy and slightly sour winter fruit, loved in rural areas.",
        "item_quantity": "500g",
        "item_weight": "500g",
        "item_price": "60 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "10-08-2025"
      }
    ]
  },
  {
    "sub_category": "All-season Fruits",
    "item_list": [
      {
        "item_name": "কলা (Banana)",
        "item_id": "AF001",
        "item_details": "Available throughout the year, a staple fruit in Bangladeshi homes.",
        "item_quantity": "1 dozen",
        "item_weight": "1.2kg",
        "item_price": "60 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "10-08-2025"
      },
      {
        "item_name": "পেঁপে (Papaya)",
        "item_id": "AF002",
        "item_details": "Common all-year fruit used both ripe and raw.",
        "item_quantity": "1 piece",
        "item_weight": "1.5kg",
        "item_price": "50 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "09-08-2025"
      },
      {
        "item_name": "আনারস (Pineapple)",
        "item_id": "AF003",
        "item_details": "Tangy tropical fruit grown year-round in regions like Sylhet and Mymensingh.",
        "item_quantity": "1 medium piece",
        "item_weight": "1.8kg",
        "item_price": "80 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "10-08-2025"
      }
    ]
  }
    ]
  },
  {
    "category": "Dairy",
    "sub_category_list": [
      {
    "sub_category": "Milk & Powdered Milk",
    "item_list": [
      {
        "item_name": "ফার্মফ্রেশ লিকুইড দুধ (Farm Fresh Liquid Milk)",
        "item_id": "MPM001",
        "item_details": "Pasteurized fresh cow milk from local dairy farms.",
        "item_quantity": "1 liter",
        "item_weight": "1000ml",
        "item_price": "80 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "08-08-2025"
      },
      {
        "item_name": "আকিজ পাউডার দুধ (Akij Powdered Milk)",
        "item_id": "MPM002",
        "item_details": "Instant full cream powdered milk.",
        "item_quantity": "500g",
        "item_weight": "500g",
        "item_price": "310 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-08-2026"
      },
      {
        "item_name": "ড্যানওন মিল্ক (Dano Milk Powder)",
        "item_id": "MPM003",
        "item_details": "Well-known imported powdered milk available in supermarkets.",
        "item_quantity": "1kg",
        "item_weight": "1000g",
        "item_price": "610 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-08-2026"
      }
    ]
  },
  {
    "sub_category": "Yogurt & Paneer",
    "item_list": [
      {
        "item_name": "মিষ্টি দই (Sweet Yogurt)",
        "item_id": "YP001",
        "item_details": "Traditional Bangladeshi sweet yogurt served in earthen pots.",
        "item_quantity": "500g",
        "item_weight": "500g",
        "item_price": "90 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "07-08-2025"
      },
      {
        "item_name": "সাধারণ টক দই (Plain Sour Yogurt)",
        "item_id": "YP002",
        "item_details": "Natural homemade-style sour yogurt.",
        "item_quantity": "500g",
        "item_weight": "500g",
        "item_price": "70 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "07-08-2025"
      },
      {
        "item_name": "পনির (Paneer)",
        "item_id": "YP003",
        "item_details": "Fresh Indian-style cheese used in cooking or eating raw.",
        "item_quantity": "250g",
        "item_weight": "250g",
        "item_price": "130 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "08-08-2025"
      }
    ]
  },
  {
    "sub_category": "Butter & Cheese",
    "item_list": [
      {
        "item_name": "আঞ্চলিক মাখন (Local Butter)",
        "item_id": "BC001",
        "item_details": "Traditionally churned homemade butter from cow milk.",
        "item_quantity": "200g",
        "item_weight": "200g",
        "item_price": "180 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "13-08-2025"
      },
      {
        "item_name": "আঞ্চলিক চীজ (Local Cheese)",
        "item_id": "BC002",
        "item_details": "Locally processed cheese made from cow milk.",
        "item_quantity": "250g",
        "item_weight": "250g",
        "item_price": "200 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "13-08-2025"
      },
      {
        "item_name": "আমুল চীজ (Amul Cheese Slices)",
        "item_id": "BC003",
        "item_details": "Processed cheese slices imported from India, available in packets.",
        "item_quantity": "200g (10 slices)",
        "item_weight": "200g",
        "item_price": "220 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-11-2025"
      }
    ]
  }
    ]
  },
  {
    "category": "Packaged Foods",
    "sub_category_list": [
     {
    "sub_category": "Biscuits & Snacks",
    "item_list": [
      {
        "item_name": "প্রাণ ক্র্যাকার্স (PRAN Crackers)",
        "item_id": "BS001",
        "item_details": "Crispy and salty biscuits, ideal for tea-time snacking.",
        "item_quantity": "200g",
        "item_weight": "200g",
        "item_price": "35 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-02-2026"
      },
      {
        "item_name": "মেরী বিস্কুট (Merry Biscuit)",
        "item_id": "BS002",
        "item_details": "Classic light sweet biscuit loved across generations.",
        "item_quantity": "300g",
        "item_weight": "300g",
        "item_price": "50 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-02-2026"
      },
      {
        "item_name": "চকোলেট ওয়েফার (Chocolate Wafer)",
        "item_id": "BS003",
        "item_details": "Crispy wafer with chocolate cream layers.",
        "item_quantity": "150g",
        "item_weight": "150g",
        "item_price": "60 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-01-2026"
      }
    ]
  },
  {
    "sub_category": "Instant item_list",
    "item_list": [
      {
        "item_name": "ম্যাগি নুডলস (Maggi Noodles)",
        "item_id": "IN001",
        "item_details": "2-minute instant noodles with masala flavor.",
        "item_quantity": "75g",
        "item_weight": "75g",
        "item_price": "25 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-11-2025"
      },
      {
        "item_name": "প্রাণ সুজি খিচুড়ি মিক্স (PRAN Suji Khichuri Mix)",
        "item_id": "IN002",
        "item_details": "Ready-to-cook suji khichuri mix with lentils and spices.",
        "item_quantity": "150g",
        "item_weight": "150g",
        "item_price": "40 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-02-2026"
      },
      {
        "item_name": "নেসক্যাফে ৩-ইন-১ (Nescafé 3-in-1)",
        "item_id": "IN003",
        "item_details": "Instant coffee mix with sugar and creamer.",
        "item_quantity": "10 sachets",
        "item_weight": "180g",
        "item_price": "180 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-05-2026"
      }
    ]
  },
  {
    "sub_category": "Pickles & Jams",
    "item_list": [
      {
        "item_name": "প্রাণ আমের আচার (PRAN Mango Pickle)",
        "item_id": "PJ001",
        "item_details": "Spicy and tangy mango pickle in mustard oil.",
        "item_quantity": "400g",
        "item_weight": "400g",
        "item_price": "90 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-08-2026"
      },
      {
        "item_name": "আনারসের আচার (Pineapple Pickle)",
        "item_id": "PJ002",
        "item_details": "Sweet and spicy pickle made with local pineapples.",
        "item_quantity": "300g",
        "item_weight": "300g",
        "item_price": "80 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-08-2026"
      },
      {
        "item_name": "রেড জাম (Red Jam)",
        "item_id": "PJ003",
        "item_details": "Sweet mixed fruit jam used as a spread on bread or biscuits.",
        "item_quantity": "500g",
        "item_weight": "500g",
        "item_price": "110 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-08-2026"
      }
    ]
  }
    ]
  },
  {
    "category": "Beverages",
    "sub_category_list": [
       {
    "sub_category": "Tea & Coffee",
    "item_list": [
      {
        "item_name": "তাজা চা পাতা (Taza Tea Leaves)",
        "item_id": "TC001",
        "item_details": "Strong and flavorful black tea leaves from Sylhet.",
        "item_quantity": "200g",
        "item_weight": "200g",
        "item_price": "70 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-08-2026"
      },
      {
        "item_name": "লিপটন ইয়েলো লেবেল (Lipton Yellow Label)",
        "item_id": "TC002",
        "item_details": "Popular branded tea bags for quick brewing.",
        "item_quantity": "100 bags",
        "item_weight": "250g",
        "item_price": "220 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-08-2026"
      },
      {
        "item_name": "নেসক্যাফে ক্লাসিক (Nescafé Classic)",
        "item_id": "TC003",
        "item_details": "Rich and aromatic instant coffee.",
        "item_quantity": "100g",
        "item_weight": "100g",
        "item_price": "320 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-08-2026"
      }
    ]
  },
  {
    "sub_category": "Soft Drinks",
    "item_list": [
      {
        "item_name": "স্প্রাইট (Sprite)",
        "item_id": "SD001",
        "item_details": "Lemon-lime flavored carbonated drink.",
        "item_quantity": "1 liter",
        "item_weight": "1 liter",
        "item_price": "70 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-02-2026"
      },
      {
        "item_name": "কোকা কোলা (Coca-Cola)",
        "item_id": "SD002",
        "item_details": "Popular cola-flavored beverage.",
        "item_quantity": "1.25 liter",
        "item_weight": "1.25 liter",
        "item_price": "80 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-02-2026"
      },
      {
        "item_name": "আরসি কোলা (RC Cola)",
        "item_id": "SD003",
        "item_details": "Affordable cola drink widely available in local shops.",
        "item_quantity": "500ml",
        "item_weight": "500ml",
        "item_price": "30 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-02-2026"
      }
    ]
  },
  {
    "sub_category": "Water & Juices",
    "item_list": [
      {
        "item_name": "মিনারেল ওয়াটার (Mum Mineral Water)",
        "item_id": "WJ001",
        "item_details": "Safe bottled mineral water.",
        "item_quantity": "1 liter",
        "item_weight": "1 liter",
        "item_price": "20 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-02-2026"
      },
      {
        "item_name": "ফ্রুটিকা আমের জুস (Frutika Mango Juice)",
        "item_id": "WJ002",
        "item_details": "Refreshing mango juice made from real fruit pulp.",
        "item_quantity": "250ml",
        "item_weight": "250ml",
        "item_price": "25 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-02-2026"
      },
      {
        "item_name": "শক্তি ড্রিংক (Speed Energy Drink)",
        "item_id": "WJ003",
        "item_details": "Popular energy drink widely consumed in Bangladesh.",
        "item_quantity": "250ml",
        "item_weight": "250ml",
        "item_price": "30 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-02-2026"
      }
    ]
  }
    ]
  },
  {
    "category": "Household Essentials",
    "sub_category_list": [
     {
    "sub_category": "Cleaning Products",
    "item_list": [
      {
        "item_name": "হারপিক টয়লেট ক্লিনার (Harpic Toilet Cleaner)",
        "item_id": "CP001",
        "item_details": "Powerful disinfectant for toilet cleaning.",
        "item_quantity": "500ml",
        "item_weight": "500ml",
        "item_price": "95 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-08-2027"
      },
      {
        "item_name": "উইলস ডিটারজেন্ট পাউডার (Wheel Detergent Powder)",
        "item_id": "CP002",
        "item_details": "Affordable detergent for washing clothes.",
        "item_quantity": "1kg",
        "item_weight": "1kg",
        "item_price": "90 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-08-2026"
      },
      {
        "item_name": "ভিম বার (Vim Bar)",
        "item_id": "CP003",
        "item_details": "Dishwashing bar for cleaning utensils.",
        "item_quantity": "300g",
        "item_weight": "300g",
        "item_price": "25 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-08-2026"
      }
    ]
  },
  {
    "sub_category": "Personal Care",
    "item_list": [
      {
        "item_name": "লাইফবয় সাবান (Lifebuoy Soap)",
        "item_id": "PC001",
        "item_details": "Antibacterial bathing soap for personal hygiene.",
        "item_quantity": "100g",
        "item_weight": "100g",
        "item_price": "40 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-08-2026"
      },
      {
        "item_name": "সানসিল্ক শ্যাম্পু (Sunsilk Shampoo)",
        "item_id": "PC002",
        "item_details": "Hair care shampoo for smooth and shiny hair.",
        "item_quantity": "180ml",
        "item_weight": "180ml",
        "item_price": "130 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-08-2026"
      },
      {
        "item_name": "ক্লোজআপ টুথপেস্ট (Closeup Toothpaste)",
        "item_id": "PC003",
        "item_details": "Flavored gel toothpaste for fresh breath and clean teeth.",
        "item_quantity": "150g",
        "item_weight": "150g",
        "item_price": "75 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-08-2026"
      }
    ]
  },
  {
    "sub_category": "Miscellaneous",
    "item_list": [
      {
        "item_name": "ম্যাচ বক্স (Match Box)",
        "item_id": "MI001",
        "item_details": "Standard matchbox for household use.",
        "item_quantity": "10 boxes",
        "item_weight": "150g",
        "item_price": "15 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-08-2028"
      },
      {
        "item_name": "প্লাস্টিক ব্যাগ (Plastic Carry Bag)",
        "item_id": "MI002",
        "item_details": "Reusable plastic bag for groceries.",
        "item_quantity": "1 piece",
        "item_weight": "50g",
        "item_price": "5 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "N/A"
      },
      {
        "item_name": "মশার কয়েল (Mosquito Coil)",
        "item_id": "MI003",
        "item_details": "Mosquito repellent coil for indoor use.",
        "item_quantity": "10 coils",
        "item_weight": "300g",
        "item_price": "35 BDT",
          "item_image_path": "",
        "batch_date": "06-08-2025",
        "exp_date": "06-08-2027"
      }
    ]
  }
    ]
  }
]
 ''';
