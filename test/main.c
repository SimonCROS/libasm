#include <stdio.h>
#include <string.h>

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
	return (0);
}
