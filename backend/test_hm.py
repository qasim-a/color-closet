from datasets import load_dataset

ds = load_dataset("Qdrant/hm_ecommerce_products", split="train", streaming=True)

for i, sample in enumerate(ds):
    if i >= 3:
        break
    print("---")
    print("name:", sample["prod_name"])
    print("color:", sample["perceived_colour_master_name"])
    print("group:", sample["product_group_name"])
    print("type:", sample["product_type_name"])
    print("appearance:", sample["graphical_appearance_name"])
    print("image_url:", sample["image_url"])
    print("index:", sample["index_group_name"])