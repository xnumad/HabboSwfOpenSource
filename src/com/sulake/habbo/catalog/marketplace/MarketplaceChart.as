package com.sulake.habbo.catalog.marketplace
{
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.display.Shape;
    import flash.display.BitmapData;
    import flash.geom.Matrix;

    public class MarketplaceChart 
    {
        private var _x:Array;
        private var _y:Array;
        private var _chartWidth:int;
        private var _chartHeight:int;
        private var _xMin:int = -30;
        private var _yMax:int;

        public function MarketplaceChart(k:Array, _arg_2:Array)
        {
            this._x = k.slice();
            this._y = _arg_2.slice();
        }

        public function draw(k:int, _arg_2:int):BitmapData
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:TextField;
            var _local_7:TextFormat;
            var _local_8:int;
            var _local_9:Shape;
            var _local_10:int;
            var _local_3:BitmapData = new BitmapData(k, _arg_2);
            if (!this.available)
            {
                return _local_3;
            }
            this._yMax = 0;
            for each (_local_4 in this._y)
            {
                if (_local_4 > this._yMax)
                {
                    this._yMax = _local_4;
                }
            }
            _local_5 = Math.pow(10, (int(this._yMax).toString().length - 1));
            this._yMax = (Math.ceil((this._yMax / _local_5)) * _local_5);
            _local_6 = new TextField();
            _local_7 = new TextFormat();
            _local_6.embedFonts = true;
            _local_7.font = "Volter";
            _local_7.size = 9;
            _local_6.defaultTextFormat = _local_7;
            _local_6.text = this._yMax.toString();
            _local_3.draw(_local_6);
            this._chartWidth = ((k - _local_6.textWidth) - 2);
            this._chartHeight = (_arg_2 - _local_6.textHeight);
            _local_8 = _local_6.textWidth;
            _local_6.text = "0";
            _local_3.draw(_local_6, new Matrix(1, 0, 0, 1, ((_local_8 - _local_6.textWidth) + 1), ((_arg_2 - _local_6.textHeight) - 1)));
            _local_9 = new Shape();
            _local_9.graphics.lineStyle(1, 0xCCCCCC);
            _local_9.graphics.moveTo(0, 0);
            _local_9.graphics.lineTo(0, this._chartHeight);
            _local_10 = 0;
            while (_local_10 <= 5)
            {
                _local_4 = (((this._chartHeight - 1) / 5) * _local_10);
                _local_9.graphics.moveTo(0, _local_4);
                _local_9.graphics.lineTo((this._chartWidth - 1), _local_4);
                _local_10++;
            }
            _local_9.graphics.lineStyle(2, 0xFF);
            _local_9.graphics.moveTo(this.getX(0), this.getY(0));
            _local_10 = 1;
            while (_local_10 < this._x.length)
            {
                _local_9.graphics.lineTo(this.getX(_local_10), this.getY(_local_10));
                _local_10++;
            }
            _local_3.draw(_local_9, new Matrix(1, 0, 0, 1, (k - this._chartWidth), ((_arg_2 - this._chartHeight) / 2)));
            return _local_3;
        }

        private function getX(k:int):Number
        {
            return this._chartWidth + ((this._chartWidth / -(this._xMin)) * this._x[k]);
        }

        private function getY(k:int):Number
        {
            return this._chartHeight - ((this._chartHeight / this._yMax) * this._y[k]);
        }

        public function get available():Boolean
        {
            return ((this._x) && (this._y)) && (this._x.length > 1);
        }
    }
}
