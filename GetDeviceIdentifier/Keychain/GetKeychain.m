//
//  GetKeychain.m
//  GetUUID
//
//  Created by Alex on 15/10/27.
//  Copyright © 2015年 Alex. All rights reserved.
//

#import "GetKeychain.h"
#import "KeychainItemWrapper.h"

@implementation GetKeychain

+ (NSString *)getDeviceIdentifierKeychain
{
    NSString *identifierKeychain = nil;
    KeychainItemWrapper *keychainWrapper = [[KeychainItemWrapper alloc]initWithIdentifier:@"Alex" accessGroup:nil];
    // 获取Keychain 设备唯一识别码
    NSString *getDeviceIdentifier = [keychainWrapper objectForKey:(id)kSecAttrAccount];
    
    if ([getDeviceIdentifier length] == 0) {
        // 如果Keychain中没有设备唯一识别码则创建
        NSString *createUUID = [[UIDevice currentDevice].identifierForVendor UUIDString];
        NSString *newUUID = [createUUID stringByReplacingOccurrencesOfString:@"-" withString:@""];
        // 保存设备识别码
        [keychainWrapper setObject:newUUID forKey:(id)kSecAttrAccount];
        identifierKeychain =  newUUID;
        NSLog(@"create uuid:%@",newUUID);
    }
    else
    {
        identifierKeychain = getDeviceIdentifier;
        NSLog(@"get uuid:%@",getDeviceIdentifier);
    }
    
    return identifierKeychain;
}

@end
