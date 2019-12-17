package com.sulake.habbo.catalog.purchase
{
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import com.sulake.core.window.IWindow;

    public class _Str_11981 
    {
        public static function _Str_21471(k:IPurchasableOffer, _arg_2:IWindow):void
        {
            if (((k == null) || (_arg_2 == null)))
            {
                return;
            }
            _arg_2.caption = ((k.isRentOffer) ? "${catalog.purchase_confirmation.rent}" : "${catalog.purchase_confirmation.buy}");
        }
    }
}
