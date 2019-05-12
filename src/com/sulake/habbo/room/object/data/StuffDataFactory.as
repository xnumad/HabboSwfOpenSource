package com.sulake.habbo.room.object.data
{
    import com.sulake.habbo.room.IStuffData;

    public class StuffDataFactory 
    {
        public static function _Str_6438(type:int):IStuffData
        {
            var stuffData:IStuffData;
            switch (type & 0xFF)
            {
                case LegacyStuffData.FORMAT_KEY: //0
                    stuffData = (new LegacyStuffData() as IStuffData);
                    break;
                case MapStuffData.FORMAT_KEY: //1
                    stuffData = (new MapStuffData() as IStuffData);
                    break;
                case StringArrayStuffData.FORMAT_KEY: //2
                    stuffData = (new StringArrayStuffData() as IStuffData);
                    break;
                case VoteResultStuffData.FORMAT_KEY: //3
                    stuffData = (new VoteResultStuffData() as IStuffData);
                    break;
                case StuffDataFormatKeyEnum.EMPTY_TYPE_KEY: //4
                    stuffData = (new EmptyStuffData() as IStuffData);
                    break;
                case StuffDataFormatKeyEnum.INT_ARRAY_TYPE_KEY: //5
                    stuffData = (new IntArrayStuffData() as IStuffData);
                    break;
                case StuffDataFormatKeyEnum.HIGH_SCORE_TYPE_KEY: //6
                    stuffData = (new HighScoreStuffData() as IStuffData);
                    break;
                case StuffDataFormatKeyEnum.CRACKABLE_TYPE_KEY: //7
                    stuffData = (new CrackableStuffData() as IStuffData);
                    break;
            }
            if (stuffData != null)
            {
                stuffData.flags = (type & 0xFF00);
            }
            return stuffData;
        }
    }
}
