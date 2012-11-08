- (IBAction)refresh:(id)sender
{    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"data.xml"];
    
    NSString *content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    buttonPushes = buttonPushes + 1;
    NSLog(@"XML Content: \n\r%@ \n\rButton Pushes: %d", content, *buttonPushes);
    
    NSData *data = [content dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error;
    
    // create a new SMXMLDocument with the contents of sample.xml
    SMXMLDocument *document = [SMXMLDocument documentWithData:data error:&error];
    
    // Pull out the <books> node
    SMXMLElement *pages = document.root;
    
    // Look through <books> children of type <book>
    for (SMXMLElement *page in [pages childrenNamed:@"page"]) {
        
        // demonstrate common cases of extracting XML data
        NSString *id = [page valueWithPath:@"id"]; // XML attribute
        NSString *title = [page valueWithPath:@"title"]; // child node value
        
        NSLog(@"id is: %@, title is %@", id, title);
        
        // show off some KVC magic
//        NSArray *authors = [[page childNamed:@"authors"].children valueForKey:@"value"];
        
        // do interesting things...
    }
    
//    document = [SMXMLDocument documentWithData:data error:&error];
//    
//    SMXMLElement *pages = [document.root childNamed:@"page"];
//    
//    for (SMXMLElement *page in [pages childrenNamed:@"page"]) {
//        
//        // demonstrate common cases of extracting XML data
//        NSString *title = [page valueWithPath:@"title"]; // XML attribute
//        NSLog(@"Title: %@", title);
//        if (title != nil) {NSLog(@"WTF! Title = nil?");}
//
//    }
    
    if (error != nil) {NSLog(@"WTF!");}
    if (error != NULL) {NSLog(@"WTF!");}
    if (error != 0) {NSLog(@"WTF!");}
    if (error == nil) {NSLog(@"WTF! nil");}
    if (error == NULL) {NSLog(@"WTF! NULL");}
    if (error == 0) {NSLog(@"WTF! 0");}
}