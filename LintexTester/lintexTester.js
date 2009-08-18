
	class	JSCocoaDocument < NSDocument
	{

		- (void)awakeFromNib
		{
		}
		
		- (NSString *)windowNibName
		{
			return	'JSCocoaDocument'
		}
		
		- (void)windowControllerDidLoadNib:(NSWindowController *) aController
		{
//			[super windowControllerDidLoadNib:aController];
			this.Super(arguments)
			// Add any code here that needs to be executed once the windowController has loaded the document's window.
			
//			NSLog(@"loaded nib");
//			NSLog(@"got %@", webView);
			this.webView.frameLoadDelegate = this
			this.webView.MainFrameURL = 'file:///Users/mini/Sites/lintex/narcissus.html'
			log('change absolute URL')
		}

		- (BOOL)readFromURL:(NSURL *)absoluteURL ofType:(NSString *)typeName error:(NSError **)outError
		{
//			NSString* str = [NSString stringWithContentsOfURL:absoluteURL encoding:NSUTF8StringEncoding error:outError];
//absoluteURL = NSURL.fileURLWithPath('/azlekzalekazmlek')
//			var str = NSString.stringWithContentsOfURL_encoding_error(absoluteURL, NSUTF8StringEncoding, outError)
			var str = NSString.stringWithContentsOfURL_encoding_error(absoluteURL, NSUTF8StringEncoding, nil)

			this.initialText = str
			this.loadInitialText()
			return	true
		}

		- (BOOL)writeToURL:(NSURL *)absoluteURL ofType:(NSString *)typeName error:(NSError **)outError
		{
			var text = this.webView.mainFrame.globalContext.rawText()
		/*
			id dict = [NSDictionary dictionaryWithObjectsAndKeys:	@"FAIL", NSLocalizedDescriptionKey, 
																	@"FAIL2", NSLocalizedFailureReasonErrorKey, 
																	@"FAIL3", NSLocalizedRecoverySuggestionErrorKey,
																	@"FAIL4", NSLocalizedRecoveryOptionsErrorKey,
																	nil];
			*outError = [NSError errorWithDomain:@"hello" code:2000 userInfo:dict];
			NSLog(@"wrote");
			return	NO;
		*/
			var str = NSString.stringWithString(String(text))
			var r = str.writeToURL_atomically_encoding_error(absoluteURL, true, NSUTF8StringEncoding, null)
			return r
//			return [@"hello" writeToURL:absoluteURL atomically:YES encoding:NSUTF8StringEncoding error:outError];
		}

			
		IBOutlet webView


		- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame
		{
//			log('done loading frame, initialText=' + this.initialText + ' this=' + this + ' context=' + this.webView.mainFrame.globalContext)
			this.loadInitialText()
		}
		
		js function	loadInitialText()
//		- (void)loadInitialText
		{
			if (!this.initialText || !this.webView)	return
			this.webView.mainFrame.globalContext.loadRawText(String(this.initialText))
		}

	}