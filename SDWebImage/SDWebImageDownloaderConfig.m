/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "SDWebImageDownloaderConfig.h"

static SDWebImageDownloaderConfig * _defaultDownloaderConfig;

@implementation SDWebImageDownloaderConfig

+ (SDWebImageDownloaderConfig *)defaultDownloaderConfig {
    if (!_defaultDownloaderConfig) {
        _defaultDownloaderConfig = [SDWebImageDownloaderConfig new];
    }
    return _defaultDownloaderConfig;
}

+ (void)setDefaultDownloaderConfig:(SDWebImageDownloaderConfig *)defaultDownloaderConfig {
    if (defaultDownloaderConfig) {
        _defaultDownloaderConfig = defaultDownloaderConfig;
    }
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _shouldDecompressImages = YES;
        _maxConcurrentDownloads = 6;
        _downloadTimeout = 15.0;
        _executionOrder = SDWebImageDownloaderFIFOExecutionOrder;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    SDWebImageDownloaderConfig *config = [[[self class] allocWithZone:zone] init];
    config.shouldDecompressImages = self.shouldDecompressImages;
    config.maxConcurrentDownloads = self.maxConcurrentDownloads;
    config.downloadTimeout = self.downloadTimeout;
    config.sessionConfiguration = [self.sessionConfiguration copyWithZone:zone];
    config.operationClass = self.operationClass;
    config.executionOrder = self.executionOrder;
    config.urlCredential = [self.urlCredential copyWithZone:zone];
    config.username = [self.username copyWithZone:zone];
    config.password = [self.password copyWithZone:zone];
    
    return config;
}


@end