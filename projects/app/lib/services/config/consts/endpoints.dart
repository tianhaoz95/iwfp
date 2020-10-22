String HttpBaseEndpoint = 'https://us-central1-iwfpapp.cloudfunctions.net';

String GetCreditCardsScope = '/httpGetCreditCards';

String RemoveAccountScope = '/httpRemoveUser';

String AddCreditCardScope = '/httpAddCreditCard';

String RemoveCreditCardScope = '/httpRemoveCreditCard';

String AddPromotionScope = '/httpAddPromo';

String RemovePromotionScope = '/httpRemovePromo';

String DeleteAccountScope = '/httpRemoveUser';

String GetCreditCardsEndpoint = HttpBaseEndpoint + GetCreditCardsScope;

String RemoveAccountEndpoint = HttpBaseEndpoint + RemoveAccountScope;

String AddCreditCardEndpoint = HttpBaseEndpoint + AddCreditCardScope;

String RemoveCreditCardEndpoint = HttpBaseEndpoint + RemoveCreditCardScope;

String AddPromotionEndpoint = HttpBaseEndpoint + AddPromotionScope;

String RemovePromotionEndpoint = HttpBaseEndpoint + RemovePromotionScope;

String DeleteAccountEndpoint = HttpBaseEndpoint + DeleteAccountScope;
