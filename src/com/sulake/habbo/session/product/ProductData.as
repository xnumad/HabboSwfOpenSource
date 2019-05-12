package com.sulake.habbo.session.product
{
    public class ProductData implements IProductData 
    {
        private var _type:String;
        private var _name:String;
        private var _description:String;

        public function ProductData(k:String, _arg_2:String, _arg_3:String)
        {
            this._type = k;
            this._name = _arg_2;
            this._description = _arg_3;
        }

        public function get type():String
        {
            return this._type;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get description():String
        {
            return this._description;
        }
    }
}
