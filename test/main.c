#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#include "libasm.h"

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

		printf("%d %d %d %d %d %d %d\n", strcmp(s5, s5), strcmp(s5, s1), strcmp(base, s1), strcmp(base, s2), strcmp(base, s3), strcmp(base, s4), strcmp(base, s5));
		printf("%d %d %d %d %d %d %d\n", ft_strcmp(s5, s5), ft_strcmp(s5, s1), ft_strcmp(base, s1), ft_strcmp(base, s2), ft_strcmp(base, s3), ft_strcmp(base, s4), ft_strcmp(base, s5));
	}
	{
		char *s1 = "Hello World!";
		char *s2 = "";

		char *sr1 = strdup(s1);
		char *sr2 = strdup(s2);
		char *mr1 = ft_strdup(s1);
		char *mr2 = ft_strdup(s2);
		printf("%s | `%s'\n", sr1, sr2);
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
		ret = read(1, str, -1);
		printf("%zd | %d\n", ret, errno);
		errno = 0;
		ret = ft_read(1, str, -1);
		printf("%zd | %d\n", ret, errno);

		errno = 0;
		ret = read(1, str, sizeof(str) - 1);
		printf("%s | %zd | %d\n", str, ret, errno);
		errno = 0;
		ret = ft_read(1, str, sizeof(str) - 1);
		printf("%s | %zd | %d\n", str, ret, errno);
	}
	return (0);
}
