# TableViewDataSource
to make a lighter controller

暂时先写中文说明

在objc.io看到精简Controller的文章，其中就有关于tableView的，建议大家可以去哪里看看。

但是在使用过程中发现，它只支持单section单identifier，所以使用block写了一个支持多section多identifier的。

在TableDataSource文件夹中，ArrayDataSource支持单section多identifier，tableViewDataSource支持多section多identifier。

注意：所有block的参数都是必填的，返回都不能为nil。
