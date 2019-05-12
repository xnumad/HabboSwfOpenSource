package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.catalog.NodeData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CatalogPagesListMessageParser implements IMessageParser 
    {
        private var _root:NodeData;
        private var _unknownBoolean:Boolean;
        private var _catalogType:String;


        public function get root():NodeData
        {
            return this._root;
        }

        public function get unknownBoolean():Boolean
        {
            return this._unknownBoolean;
        }

        public function get catalogType():String
        {
            return this._catalogType;
        }

        public function flush():Boolean
        {
            this._root = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._root = new NodeData(k);
            this._unknownBoolean = k.readBoolean();
            this._catalogType = k.readString();
            return true;
        }
    }
}
