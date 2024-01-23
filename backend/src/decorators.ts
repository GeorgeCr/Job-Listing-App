import { SetMetadata } from '@nestjs/common';

export const skipAuthKey = 'SKIP_AUTH';
export const SkipAuth = () => SetMetadata(skipAuthKey, true);
