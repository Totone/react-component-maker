# React Component Maker

**React.js components creation, faster**

## GETTING STARTED

1. Download or clone this repository  
  `git clone`  
  You also can just copy the index file in your clipboard and paste it in a file on your desktop
2. Put the script in your React project  
  I have a `_dev/` folder in my projects root folder which stores scripts & dev stuff but you can put it wherever you want
3. Be sure that the script is executable  
  `chmod +x script.sh`
4. Tip: You can create a shortcut in `package.json` scripts, e.g `newComp: ./_dev/newReactComponent.sh` (assuming that the script is in a `_dev` folder) to use it easily
5. Create a component with the command: `npm run newComp CompName`

## WHAT IS THAT

This is just a script which creates everything needed when you want to create a new component in a React.js project.

### React structure patterns

There is plenty of patterns to handle React components. In order to be the most efficient, this is my way:

```bash
 src
  └── components
          └── ComponentName
                  ├── index.jsx
                  ├── ComponentName.scss
                  ├── ComponentName-view.jsx
                  └── ComponentName-container.jsx
```

- You can import component in other React components easily thanks to `index.jsx`
- You are not lost by working on several `index.jsx` files at the same time in your loved IDE.
- View & logic are in separated files, respecting SOC principle

### Purpose of this script

React is not really a framework & doesn't come with easy ways to create new elements.  
So each time you want to create a component you need:

- To create a new folder in `components/`
- Create an `index.jsx` file
- Create an `ComponentName-view.jsx` file
- Create an `ComponentName-container.jsx` file
- Create an `ComponentName.scss` file

And if you want to create another component you HAVE TO do this again, and again...

This script allows you to create everything needed with a single command, seriously enhancing your coding times!

### How to use it

- Simple. Just call the script with the new component's name as an argument.  
- If argument is not set, script asks you what name you want for your new component.  
- If a component with the same name already exists, the script warns you & ends.
- Else, it creates & fills files to get the component directly usable in your project.

## Edit the script

Feel free to edit the script if you don't want to use my pattern. You just need to change variables values:

- `pathToComponentsFolder`: If you store your components in another location, set it in this variable
- `reactExt`: You can modify this variable if you want to use `.js` or if you use typeScript with `.ts` & `.tsx` extensions
- `styleExt`: Mayyyybee you works with css... In this case, edit this variable...

You can change files names in their variables:

- `indexFilename`
- `viewFilename`
- `containerFilename`
- `styleFilename`

You can change files content in lists set in functions:

- `fillIndex`
- `fillView`
- `fillContainer`

## Conclusion

At first it was just a script among others I used to enhance my developper's routines. I got the idea to write it in bash instead of node & share it. I tried to make it more universal to be useful by everybody.  
Feel free to give my any feedback you want, or support my work the ways you want !
