[上一篇](https://blog.csdn.net/jianghui12138/article/details/84789896) 刚把跟价格有关的数据运算做好，今天新版本上线就遇到新的问题，只好把这个情况记录一下，方便别人以后不要再踩这个坑了。

使用 `NSNumberFormatter` 处理价格没有什么问题，但是如果你拿到转换的字符串再进行 `floatValue` 操作，就可能出现问题了。

看代码：

    - (void)test1
    {
        CGFloat f = 1999.21;
        
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.maximumFractionDigits = 1;
        formatter.numberStyle = kCFNumberFormatterDecimalStyle;
        
        NSString *s = [formatter stringFromNumber:@(f)];
        NSLog(@"字符串 -- %@", s);
        
        CGFloat r = [s floatValue];
        NSLog(@"数值 -- %.1f", r);
        
        // 打印结果
        /*
         2018-12-15 19:30:24.381564+0800 TestNumber2[23989:224784] 字符串 -- 1,999.2
         2018-12-15 19:30:24.381752+0800 TestNumber2[23989:224784] 数值 -- 1.0
         */
    }
    
这里第一步拿到字符串是没有问题的，到最后拿到数值的时候出现了问题，而且结果也是直接舍去的。为毛会这样呢？其实这就是逗号(,)作为分组符搞的鬼。

解决这个问题，只需要一行代码足够了。代码如下：

    - (void)test2
    {
        CGFloat f = 1999.21;
        
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.maximumFractionDigits = 1;
        formatter.numberStyle = kCFNumberFormatterDecimalStyle;
        formatter.usesGroupingSeparator = NO; // 不使用分组符号
        
        NSString *s = [formatter stringFromNumber:@(f)];
        NSLog(@"字符串 -- %@", s);
        
        CGFloat r = [s floatValue];
        NSLog(@"数值 -- %.1f", r);
        
        // 打印结果
        /*
         2018-12-15 19:33:41.701357+0800 TestNumber2[24111:226638] 字符串 -- 1999.2
         2018-12-15 19:33:41.701608+0800 TestNumber2[24111:226638] 数值 -- 1999.2
         */
    }
    
这里，不使用分组符就可以解决问题。当然如果你不对结果做数值运算，也不会遇到这种问题。

既然上面提到了分组符，顺便说下分组符是可以自定义的，代码如下：

    - (void)test3
    {
        CGFloat f = 1999.21;
        
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.maximumFractionDigits = 1;
        formatter.numberStyle = kCFNumberFormatterDecimalStyle;
        formatter.groupingSeparator = @" ";
        
        NSString *s = [formatter stringFromNumber:@(f)];
        NSLog(@"字符串 -- %@", s);
        
        CGFloat r = [s floatValue];
        NSLog(@"数值 -- %.1f", r);
        
        // 打印结果
        /*
         2018-12-15 19:36:35.211693+0800 TestNumber2[24229:228413] 字符串 -- 1 999.2
         2018-12-15 19:36:35.211894+0800 TestNumber2[24229:228413] 数值 -- 1.0
         */
    }
    
    - (void)test4
    {
        CGFloat f = 1999.21;
        
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.maximumFractionDigits = 1;
        formatter.numberStyle = kCFNumberFormatterDecimalStyle;
        formatter.groupingSeparator = @"";
        
        NSString *s = [formatter stringFromNumber:@(f)];
        NSLog(@"字符串 -- %@", s);
        
        CGFloat r = [s floatValue];
        NSLog(@"数值 -- %.1f", r);
        
        // 打印结果
        /*
         2018-12-15 19:38:33.911502+0800 TestNumber2[24303:229946] 字符串 -- 1999.2
         2018-12-15 19:38:33.911727+0800 TestNumber2[24303:229946] 数值 -- 1999.2
         */
    }
    
其实，这里把分组符换成空字符串也可以解决这个问题。

ps: 手机淘宝中的数值格式就不一样，搜索页面不带分隔符，猜你喜欢带。

以上就是遇到的新问题，有兴趣可以去把有关 `NSNumberFormatter` 的知识点补充一下，上面用到的测试用例[在这里](https://github.com/jianghui1/TestNumber2)。
