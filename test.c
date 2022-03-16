#include "includes/libasm.h"

void a(t_list **begin_list, int (*cmp)()) {
	if (!*begin_list)
		return;
	t_list *cur = *begin_list;
	int updated = 1;
	while (updated) {
		updated = 0;
		while (cur->next != NULL) {
			if (cmp(cur->data, cur->next->data) > 0) {
				void *tmp = cur->data;
				cur->data = cur->next->data;
				cur->next->data = tmp;
				updated = 1;
			}
		}
	}
}
