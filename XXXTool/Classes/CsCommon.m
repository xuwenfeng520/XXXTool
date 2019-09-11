//
//  CsCommon.m
//  CsBtUtil
//
//  Created by ChipSea on 15/12/25.
//  Copyright © 2015年 chipsea. All rights reserved.
//

#import "CsCommon.h"

static NSString *CACHE_MAC = @"cache_mac_address";
static NSString *CACHE_PROTOCOL_TYPE = @"cache_protocol_type";
static NSString *CACHE_ISHandleR1 = @"cache_is_handle_r1";
static NSString * CACHE_Product_ID = @"cache_product_id";

@implementation CsCommon

+(Byte)getScalePropertyByUnit:(CsDeviceWeightUnit)unit precision:(int)precision
{
    Byte bRet;
    Byte bLock = 0x01;
    Byte bPrec;
    Byte bUnit;
    switch (precision)
    {
        case 0:
            bPrec = 0x01;
            break;
        case 1:
            bPrec = 0x00;
            break;
        case 2:
            bPrec = 0x10;
            break;
        default:
            bPrec = 0x00;
            break;
    }
    switch (unit)
    {
        case CsDeviceWeightUnitKg:
            bUnit = 0x00;
            break;
        case CsDeviceWeightUnitLb:
            bUnit = 0x02;
            break;
        case CsDeviceWeightUnitJin:
            bUnit = 0x01;
            break;
        case CsDeviceWeightUnitStLb:
            bUnit = 0x03;
            break;
    }
    bRet = (bUnit << 3) | (bPrec << 1) | (bLock);
    return bRet;
}

/**
 *  根据称量属性获得单位
 *
 *  @param scaleProperty 称量属性
 *  称量属性说明:
 *  Bit       7      6      5      4      3      2      1      0
 *          保留    保留   保留    单位    单位  小数位  小数位   是否锁定
 *
 *  @return 单位
 */
+(CsDeviceWeightUnit)getUnitFromScaleProperty:(Byte)scaleProperty
{
    int unit =(scaleProperty & 0x18) >> 3;
    switch (unit)
    {
        case 0x00:
            return CsDeviceWeightUnitKg;
        case 0x01:
            return CsDeviceWeightUnitJin;
        case 0x02:
            return CsDeviceWeightUnitLb;
        case 0x03:
            return CsDeviceWeightUnitStLb;
        default:
            return CsDeviceWeightUnitKg;
    }
}

/**
 *  根据称量属性获得小数位数
 *
 *  @param scaleProperty 称量属性
 *  称量属性说明:
 *  Bit       7      6      5      4      3      2      1      0
 *          保留    保留   保留    单位    单位  小数位  小数位   是否锁定
 *
 *  @return 小数位数
 */
+(int)getValuePrecisionFromScaleProperty:(Byte)scaleProperty
{
    Byte precision = (scaleProperty & 0x06) >> 1;
    switch (precision)
    {
        case 0x00:
            return 1;
        case 0x01:
            return 0;
        case 0x02:
            return 2;
        default:
            return 1;
    }
}


/**
 * 传入两个data,转换成字符串，交换拼接，再转换成 int
 （注：此方法作废，请调用下面的 changeByteToLongByData  或者 changeByteToLongByByte 方法）
 @param data1 低位数 (在后面)
 @param data2 高位数 (在前面)
 @return 转换后得到的数字
 */
+(int)genNumFromData1:(NSData *)data1 Data2:(NSData *)data2
{
    NSString * data1Str = [[data1 description] substringWithRange:NSMakeRange(1, 2)];
    NSString * data2Str = [[data2 description] substringWithRange:NSMakeRange(1, 2)];
    
    NSString * dataStrHex = [NSString stringWithFormat:@"0x%@%@",data2Str,data1Str];
    
    return (int)strtoul([dataStrHex UTF8String],0,16);
}

/**
 * 传入两个data,转换成字符串 ST:LB
 * @param data1 ST
 * @param data2 LB
 * @return return @[@(weight),weightStr];  体重kg , 体重st:lb
 **/
+(NSArray *)genNumFromDataST_LB:(NSData *)data1 Data2:(NSData *)data2
{
    NSString * data1Str = [NSString stringWithFormat:@"0x%@",[[data1 description] substringWithRange:NSMakeRange(1, 2)]];
    NSString * data2Str = [NSString stringWithFormat:@"0x%@",[[data2 description] substringWithRange:NSMakeRange(1, 2)]];
    float stone = strtoul([data1Str UTF8String],0,16);
    float lb = strtoul([data2Str UTF8String],0,16) * 0.1f;
    float lbTotal = lb + stone * 14;
    float weight = lbTotal * 0.4535924;
    NSString * weightStr = [NSString stringWithFormat:@"%.0f:%.1f", stone, lb];
    return @[@(weight),weightStr];
}


+(NSData *)getBooleanArray:(Byte)b
{
    Byte bt[] = {0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};
    for(int i = 0; i<8; i++)
    {
        bt[i] = (Byte)(b & 1);
        b = (Byte)(b>>1);
    }
    return [[NSData alloc] initWithBytes:bt length:8];
}



/**
 从NSData中，取数转换成 Long型

 @param data NSData
 @param index 从第几位开始
 @param length 长度
 @param isAsc 是否为顺序（YES:顺序，高位在前，低位在后；   NO：反序，低们在前，高位在后）
 @return 返回数
 */
+(long)changeByteToLongByData:(NSData *)data from:(int)index length:(int)length isAsc:(BOOL)isAsc
{
    Byte * dataByte = (Byte *)(data.bytes);
    return [self changeByteToLongByByte:&dataByte from:index length:length isAsc:isAsc];
}

/**
 从Byte中，取数转换成 Long型
 
 实际示例：
 long scaleUTC = (long)(((dataByte[iIndex] & 0xff) << 24) | ((dataByte[iIndex + 1] & 0xff) << 16) | ((dataByte[iIndex + 2] & 0xff) << 8) | (dataByte[iIndex + 3] & 0xff));
 说明：每一位占（16进制2位，2进制8位），所以左移8位，移位后成了int 类型，如果赋值只能相加

 @param dataByte Byte**
 @param index 从第几位开始
 @param length 长度
 @param isAsc 是否为顺序（YES:顺序，高位在前，低位在后；   NO：反序，低们在前，高位在后）
 @return 返回数
 */
+(long)changeByteToLongByByte:(Byte **)dataByte from:(int)index length:(int)length isAsc:(BOOL)isAsc
{
    Byte * newdataByte = * dataByte;
    long sum = 0;
    for(int i = 0; i < length; i++)
    {
        if(isAsc)
        {
            sum +=  ((newdataByte[index + i] & 0xff) << ((length - 1 - i) * 8));
        }else
        {
            sum +=  ((newdataByte[index + i] & 0xff) << (i * 8));
        }
    }
    return sum;
}


#pragma mark - long long转NSData
+ (NSData *)longToNSData:(long)data
{
    long datatemplength = CFSwapInt32(data);
    //CFSwapInt64BigToHost(data);  //大小端不一样，需要转化
    NSData *temdata = [NSData dataWithBytes: &datatemplength length: sizeof(datatemplength)];
    return temdata;
}





/**
 * 十六进制数据转化为数组
 *
 * @param data 十六进制数据
 * @return 转化后的数组
 */
+ (NSMutableArray *)convertDataToHexStr:(NSData *)data
{
    if (!data || [data length] == 0)
    {
        return nil;
    }
    // 将切割好的十六进制数塞入一个可变数组
    NSMutableArray * dataArr = [NSMutableArray new];
    
    [data enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        unsigned char *dataBytes = (unsigned char*)bytes;
        
        for (NSInteger i = 0; i < byteRange.length; i++)
        {
            // 将byte数组切割成一个个字符串
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            
            // 因十六进制数据为 0X XXXX 以两字节为一位数,所以需要在切割出来的数据进行补零操作
            if ([hexStr length] == 2)
            {
                [dataArr addObject:hexStr];
            } else
            {
                [dataArr addObject:[NSString stringWithFormat:@"0%@",hexStr]];
            }
        }
    }];
    return dataArr;
}



/**
 * 将十六进制数 转化十进制数
 * @return 返回的数据NSString
 */
+ (NSString *)handStrtoulStr:(NSString *)str
{
    /*
     确保十六进制数每个数为两位
     */
    NSString *string = [self addZero:str withLength:2];
    NSString *rechargeInfo =  [NSString stringWithFormat:@"0x%@",string];
    rechargeInfo = [NSString stringWithFormat:@"%ld",strtoul([rechargeInfo UTF8String],0,16)];
    //不够一个字节凑0
    if(rechargeInfo.length == 1){
        return [NSString stringWithFormat:@"0%@",rechargeInfo];
    }else{
        return rechargeInfo;
    }
    
    return rechargeInfo;
}

//字符串补零操作
+ (NSString *)addZero:(NSString *)str withLength:(int)length
{
    NSString *string = nil;
    if (str.length==length)
    {
        return str;
    }
    if (str.length<length)
    {
        NSUInteger inter = length-str.length;
        for (int i=0;i< inter; i++)
        {
            string = [NSString stringWithFormat:@"0%@",str];
            str = string;
        }
    }
    return string;
}

//将16进制转化为十进制 返回的数为NSInteger
+ (NSInteger)getDecimalByHex:(NSString *)hex
{
    return strtoul([hex UTF8String], 0, 16);
}


+ (NSData *)getCheckSum:(NSString *)byteStr
{
    int length = (int)byteStr.length/2;
    NSData *data = [self hexToBytes:byteStr];
    Byte *bytes = (unsigned char *)[data bytes];
    Byte sum = 0;
    for (int i = 0; i<length; i++) {
        sum += bytes[i];
    }
    int at = sum;
    //int sumT = sum;
    //int at = 256 -  sumT;
    
    //    printf("校验和：%d\n",at);
    if (at == 256) {
        at = 0;
    }
    NSString *str = [NSString stringWithFormat:@"%@%@",byteStr,[self ToHex:at]];
    return [self hexToBytes:str];
}

+ (NSData *)hexToBytes:(NSString *)str
{
    NSMutableData* data = [NSMutableData data];
    int idx;
    for (idx = 0; idx+2 <= str.length; idx+=2)
    {
        NSRange range = NSMakeRange(idx, 2);
        NSString* hexStr = [str substringWithRange:range];
        NSScanner* scanner = [NSScanner scannerWithString:hexStr];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        [data appendBytes:&intValue length:1];
    }
    return data;
}


//将十进制转化为十六进制
+ (NSString *)ToHex:(int)tmpid
{
    NSString *nLetterValue;
    NSString *str =@"";
    int ttmpig;
    for (int i = 0; i<9; i++) {
        ttmpig=tmpid%16;
        tmpid=tmpid/16;
        switch (ttmpig)
        {
            case 10:
                nLetterValue =@"A";break;
            case 11:
                nLetterValue =@"B";break;
            case 12:
                nLetterValue =@"C";break;
            case 13:
                nLetterValue =@"D";break;
            case 14:
                nLetterValue =@"E";break;
            case 15:
                nLetterValue =@"F";break;
            default:
                nLetterValue = [NSString stringWithFormat:@"%u",ttmpig];
                
        }
        str = [nLetterValue stringByAppendingString:str];
        if (tmpid == 0) {
            break;
        }
    }
    //不够一个字节凑0
    if(str.length == 1){
        return [NSString stringWithFormat:@"0%@",str];
    }else{
        return str;
    }
}
@end
