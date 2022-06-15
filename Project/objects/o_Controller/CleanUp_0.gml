/// @description Clean up memory
for (var i = 0; i < ds_list_size(NODES); i++) {
	delete NODES[| i];
}

for (var i = 0; i < ds_list_size(TABS); i++) {
	delete TABS[| i];
}

ds_list_destroy(NODES);
ds_list_destroy(TABS);
