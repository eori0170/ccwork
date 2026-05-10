export default {
  extends: ['@commitlint/config-conventional'],
  plugins: [
    {
      rules: {
        'body-min-lines': ({ body }) => {
          const lines = (body ?? '').trim().split('\n').filter((l) => l.trim() !== '');
          return [lines.length >= 2, '본문은 2줄 이상 작성해야 합니다'];
        },
      },
    },
  ],
  rules: {
    'subject-empty': [2, 'never'],
    'body-empty': [2, 'never'],
    'body-min-lines': [2, 'always'],
  },
};
