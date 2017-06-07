//
//  MXLoadImageViewController.m
//  MXReview
//
//  Created by 马霄 on 27/04/2017.
//  Copyright © 2017 马 霄. All rights reserved.
//

#import "MXLoadImageViewController.h"

@interface MXLoadImageViewController ()<UIActionSheetDelegate>{
    // 保存图片的容器
    UIImageView *_sentImg;
}

@end

@implementation MXLoadImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = _titleString;
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width)];
    img.userInteractionEnabled = YES;
    img.backgroundColor = [UIColor redColor];
    
    NSString * documentsDirectoryPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSLog(@"保存路径:%@",documentsDirectoryPath);
    //Get Image From URL
    UIImage * imageFromURL = [self getImageFromURL:@"http://a.hiphotos.baidu.com/zhidao/pic/item/d1160924ab18972b0c6e3752e0cd7b899f510ad5.jpg"];
    
    //Save Image to Directory
    [self saveImage:imageFromURL withFileName:@"MyImage" ofType:@"jpg" inDirectory:documentsDirectoryPath];
    
    //Load Image From Directory
    UIImage * imageFromWeb = [self loadImage:@"MyImage" ofType:@"jpg" inDirectory:documentsDirectoryPath];
    [img setImage:imageFromWeb];
    
    //取得目录下所有文件名
    NSArray *file = [[[NSFileManager alloc] init] subpathsAtPath:documentsDirectoryPath];
    //NSLog(@"%d",[file count]);
    NSLog(@"file --- %@",file);
    
    // 添加长按手势
    UILongPressGestureRecognizer *longTap = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longImgClick:)];
    [img addGestureRecognizer:longTap];
    
    [self.view addSubview:img];
}

#pragma mark - 保存图片到沙河
-(UIImage *)getImageFromURL:(NSString *)fileURL {
    NSLog(@"执行图片下载函数");
    UIImage * result;
    
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    result = [UIImage imageWithData:data];
    
    return result;
}


-(void)saveImage:(UIImage *)image withFileName:(NSString *)imageName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath {
    if ([[extension lowercaseString] isEqualToString:@"png"]) {
        [UIImagePNGRepresentation(image) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"png"]] options:NSAtomicWrite error:nil];
    } else if ([[extension lowercaseString] isEqualToString:@"jpg"] || [[extension lowercaseString] isEqualToString:@"jpeg"]) {
        [UIImageJPEGRepresentation(image, 1.0) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"jpg"]] options:NSAtomicWrite error:nil];
    } else {
        //ALog(@"Image Save Failed\nExtension: (%@) is not recognized, use (PNG/JPG)", extension);
        NSLog(@"文件后缀不认识");
    }
}


-(UIImage *)loadImage:(NSString *)fileName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath {
    UIImage * result = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@.%@", directoryPath, fileName, extension]];
    return result;
}

#pragma mark - 保存图片到本地相册
- (void)longImgClick:(UILongPressGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"保存图片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"保存图片到手机", nil];
        actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
        [actionSheet showInView:self.view];
        UIImageView *img = (UIImageView *)[gesture view];
        _sentImg = img;
    }
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet*)actionSheet didDismissWithButtonIndex:  (NSInteger)buttonIndex {
    
    if(buttonIndex == 0) {
        // 调用系统的保存图片到本地相册方法
        UIImageWriteToSavedPhotosAlbum(_sentImg.image,self,@selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:),nil);
    }
}

// 自定义回调方法
- (void)imageSavedToPhotosAlbum:(UIImage*)image didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo {
    
    NSString*message = @"系统相册回调方法";
    
    if(!error) {
        
        message =@"成功保存到相册";
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"确定"otherButtonTitles:nil];
        
        [alert show];
        
    }else
    {
        
        message = [error description];
        
        UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"提示"message:message delegate:self cancelButtonTitle:@"确定"otherButtonTitles:nil];
        
        [alert show];
    }
}

@end
