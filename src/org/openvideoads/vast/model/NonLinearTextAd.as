package org.openvideoads.vast.model
{
    import flash.xml.*;

    public class NonLinearTextAd extends NonLinearVideoAd 
    {
        protected var _Str_2495:String = null;
        protected var _Str_1858:String = null;
        protected var _Str_20556:String = null;


        override public function set codeBlock(k:String):void
        {
            _Str_3366 = "<TextAd>";
            _Str_3366 = (_Str_3366 + k);
            _Str_3366 = (_Str_3366 + "</TextAd>");
            this.parse();
        }

        protected function parse():void
        {
            var k:XML = new XML(_Str_3366);
            if (k.length() > 0)
            {
                if (k.Title != undefined)
                {
                    this._Str_2495 = k.Title.text();
                }
                if (k.Description != undefined)
                {
                    this._Str_1858 = k.Description.text();
                }
                if (k.CallToAction != undefined)
                {
                    this._Str_20556 = k.CallToAction.text();
                }
            }
        }

        public function get title():String
        {
            return this._Str_2495;
        }

        public function get description():String
        {
            return this._Str_1858;
        }

        public function get callToActionTitle():String
        {
            return this._Str_20556;
        }

        override public function rawContentAsObject():Object
        {
            return ({
                "type":"TEXT",
                "format":"TEXT",
                "content":{
                    "title":this.title,
                    "description":this.description,
                    "callToActionTitle":this.callToActionTitle
                }
            });
        }
    }
}
