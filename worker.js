
var n = 1;
search: while (true) {
  n += 1;

if (n == 10000)	
{
	postMessage('DONE')
	break
}

  for (var i = 2; i <= Math.sqrt(n); i += 1)
    if (n % i == 0)
     continue search;
  // found a prime!
  postMessage('=>=>=>' + n);

}
