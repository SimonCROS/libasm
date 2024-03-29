#include <stdio.h>

#include "libasm.h"

void	print_list(t_list *front) {
	t_list *current = front;

	printf("size : %d | ", ft_list_size(front));
	while (current) {
		printf("`%s', ", (char *)current->data);
		current = current->next;
	}
	printf("0x0\n");
}

int	always_zero() {
	return 0;
}

int	main(void)
{
	{
		char *str = "Hello World!";
		size_t len;

		len = strlen(str);
		printf("%zu (%s)\n", len, str);
		len = ft_strlen(str);
		printf("%zu (%s)\n", len, str);
	}
	{
		char *str = "Hello World!";
		char buf[100];
		char *ret;

		memset(buf, 42, 100);
		ret = strcpy(buf, str);
		printf("buf %p = %s | src %p = %s | dst %p = %s\n", buf, buf, str, str, ret, ret);

		memset(buf, 42, 100);
		ret = ft_strcpy(buf, str);
		printf("buf %p = %s | src %p = %s | dst %p = %s\n", buf, buf, str, str, ret, ret);
	}
	{
		char *base = "Hello World!";
		char *s1 = "Hello World!";
		char *s2 = "Hello World?";
		char *s3 = "Hello World!!!!";
		char *s4 = "Hello!";
		char *s5 = "";

		printf("%+4d %+4d %+4d %+4d %+4d %+4d %+4d\n",    strcmp(s5, s5),    strcmp(s5, s1),    strcmp(base, s1),    strcmp(base, s2),    strcmp(base, s3),    strcmp(base, s4),    strcmp(base, s5));
		printf("%+4d %+4d %+4d %+4d %+4d %+4d %+4d\n", ft_strcmp(s5, s5), ft_strcmp(s5, s1), ft_strcmp(base, s1), ft_strcmp(base, s2), ft_strcmp(base, s3), ft_strcmp(base, s4), ft_strcmp(base, s5));
	}
	{
		char *s1 = "Hello World!";
		char *s2 = "";

		char *sr1 = strdup(s1);
		char *sr2 = strdup(s2);
		printf("%s | `%s'\n", sr1, sr2);
		char *mr1 = ft_strdup(s1);
		char *mr2 = ft_strdup(s2);
		printf("%s | `%s'\n", mr1, mr2);

		free(sr1);
		free(sr2);
		free(mr1);
		free(mr2);
	}
	{
		const char str[12] = "Hello World!";
		ssize_t ret;

		errno = 0;
		ret = write(1, str, -1);
		printf(" | %zd | %d\n", ret, errno);
		errno = 0;
		ret = ft_write(1, str, -1);
		printf(" | %zd | %d\n", ret, errno);

		errno = 0;
		ret = write(1, str, sizeof(str));
		printf(" | %zd | %d\n", ret, errno);
		errno = 0;
		ret = ft_write(1, str, sizeof(str));
		printf(" | %zd | %d\n", ret, errno);
	}
	{
		char str[6];
		str[sizeof(str) - 1] = 0;
		ssize_t ret;

		errno = 0;
		ret = read(0, str, -1);
		printf("%zd | %d\n", ret, errno);
		errno = 0;
		ret = ft_read(0, str, -1);
		printf("%zd | %d\n", ret, errno);

		printf("Enter 10 characters:\033[31m\n");
		errno = 0;
		ret = read(0, str, sizeof(str) - 1);
		printf("\033[0m%s | %zd | %d\n", str, ret, errno);
		errno = 0;
		ret = ft_read(0, str, sizeof(str) - 1);
		printf("%s | %zd | %d\n", str, ret, errno);
	}
	{
		printf("%d ", ft_atoi_base("2a", "0123456789abcdef"));
		printf("%d ", ft_atoi_base("011", "01"));
		printf("%d ", ft_atoi_base("", "0123456789"));
		printf("%d ", ft_atoi_base(" \v\t--+-4242", "0123456789"));
		printf("%d ", ft_atoi_base("  \t--+--4242", "0123456789"));
		printf("\n");
		printf("%d ", ft_atoi_base("42", "01234567 89abcde"));
		printf("%d ", ft_atoi_base("42", "01234567+89abcde"));
		printf("%d ", ft_atoi_base("42", "01234567889abcde"));
		printf("%d ", ft_atoi_base("42", "0"));
		printf("%d ", ft_atoi_base("42", ""));
		printf("\n");
	}
	{
		t_list *base;
		base = NULL;

		char *zero = "0";
		char *one = "1";
		char *two = "2";
		char *three = "3";
		char *four = "4";

		print_list(base);

		ft_list_push_front(&base, one);
		print_list(base);

		ft_list_push_front(&base, two);
		print_list(base);

		ft_list_push_front(&base, four);
		print_list(base);

		ft_list_push_front(&base, three);
		print_list(base);

		ft_list_push_front(&base, zero);
		print_list(base);

		ft_list_push_front(&base, ft_strdup("tofree"));
		print_list(base);

		ft_list_sort(&base, ft_strcmp);
		print_list(base);

		ft_list_remove_if(&base, "3", ft_strcmp, NULL);
		print_list(base);

		ft_list_remove_if(&base, "tofree", ft_strcmp, free);
		print_list(base);

		ft_list_remove_if(&base, "", always_zero, NULL);
		print_list(base);
	}
	return (0);
}
