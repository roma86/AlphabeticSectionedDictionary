#Get dictionary for UITableView sections

\- get as parameter an array with NSString's objects

\- return dictionary of NSArrays grouped by first character as key

```objective-c
#pragma mark - Table view data source
```

```objective-c
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
return [[self.sections allKeys] count];
}
```

```objective-c
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
return [[[self.sections allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section];
}
```

```objective-c
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
return [[self.sections valueForKey:[[[self.sections allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section]] count];
}
```

```objective-c
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
cell.textLabel.text = [[self.sections valueForKey:[[[self.sections allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
}
```
